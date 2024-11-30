import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_handler.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/workout.schema.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workouts_in_wave.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/modal/workout_wave.model.dart';
import 'package:rxdart/rxdart.dart';

part 'workout_wave.dao.g.dart';

@DriftAccessor(tables: [
  WorkoutWaves,
  WorkoutsWithMeasures,
  Workouts,
  WorkoutsInWaves,
])
class WorkoutWaveDao extends DatabaseAccessor<AppDatabase>
    with _$WorkoutWaveDaoMixin {
  WorkoutWaveDao(super.key);

  Stream<List<WorkoutWaveModel>> watchWorkoutWaves() {
    return select(workoutWaves)
        .watch()
        .map(
          (workoutWaves) => workoutWaves
              .map(
                (workoutWave) => WorkoutWaveModel.fromDbModel(workoutWave),
              )
              .toList(),
        )
        .handleError((error) {
      final errorMsg = somethingWentWrongMsg("getting your workout waves");
      throw AppError(message: errorMsg);
    });
  }

  Stream<List<WorkoutWaveWithWorkoutsMeasureModel>>
      watchWorkoutWaveWithWorkoutMeasures() {
    final workoutWavesStream = select(workoutWaves).watch();

    return workoutWavesStream.switchMap(
      (workoutWavesList) {
        final idToWorkoutWave = {
          for (var workoutWave in workoutWavesList) workoutWave.id: workoutWave
        };
        final ids = idToWorkoutWave.keys;

        final query = select(workoutsInWaves).join([
          leftOuterJoin(
            workoutsWithMeasures,
            workoutsWithMeasures.id
                .equalsExp(workoutsInWaves.workoutWithMeasureId),
          ),
          leftOuterJoin(
            workouts,
            workouts.id.equalsExp(workoutsWithMeasures.workoutId),
          ),
        ]);

        return query.watch().map((rows) {
          final Map<int, List<WorkoutsInWave>> idToPosition = {};
          final Map<int, List<WorkoutsWithMeasure>> idToWorkoutsWithMeasure =
              {};
          final Map<int, List<Workout>> idToWorkout = {};

          for (var row in rows) {
            final positionDetail = row.readTableOrNull(workoutsInWaves);
            final countDetail = row.readTableOrNull(workoutsWithMeasures);
            final workoutDetail = row.readTableOrNull(workouts);

            if (positionDetail == null ||
                countDetail == null ||
                workoutDetail == null) continue;
            final id = positionDetail.workoutWaveId;

            idToPosition.putIfAbsent(id, () => []).add(positionDetail);
            idToWorkoutsWithMeasure.putIfAbsent(id, () => []).add(countDetail);
            idToWorkout.putIfAbsent(id, () => []).add(workoutDetail);
          }

          return ids.map((id) {
            final workoutWaveDetail = workoutWavesList[id - 1];
            final positionDetails = idToPosition[id] ?? [];
            final workoutsWithMeasureDetails =
                idToWorkoutsWithMeasure[id] ?? [];
            final workoutDetails = idToWorkout[id] ?? [];

            return WorkoutWaveWithWorkoutsMeasureModel.fromDbModel(
              workoutWaveDetail: workoutWaveDetail,
              positionDetails: positionDetails,
              workoutsWithMeasureDetails: workoutsWithMeasureDetails,
              workoutDetails: workoutDetails,
            );
          }).toList();
        }).handleError((error) {
          final errorMsg = somethingWentWrongMsg("getting your workout waves");
          throw AppError(message: errorMsg);
        });
      },
    );
  }

  Future<void> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureModel workoutWaveWithWorkoutMeasures,
  ) async {
    return handleError(() async {
      await transaction(() async {
        // 1. first insert the workout wave and get the id
        final workoutWaveId = await (into(workoutWaves)
            .insert(workoutWaveWithWorkoutMeasures.workoutWave.toCompanion()));

        // 2. Get all the existing workoutWithMeasures
        final existingWorkoutsWithMeasures = await _getExistingWorkout(
          workoutWaveWithWorkoutMeasures.workoutsWithMeasure,
        );

        final workoutsWithMeasure =
            workoutWaveWithWorkoutMeasures.workoutsWithMeasure;

        // 3. Insert any new workoutWithMeasure and return everything that needs to be inserted
        final workoutsWithMeasureWithId =
            await _insertNewWorkoutWithMeasureReturning(
          workoutWaveId,
          existingWorkoutsWithMeasures,
          workoutsWithMeasure,
        );

        // 4. Map all workoutWithMeasures to workoutWave
        await _mapWorkoutsWithMeasureToWorkoutWave(
          workoutWaveId,
          workoutsWithMeasureWithId,
        );
      });
    }, "adding your workout wave");
  }

  Future<WorkoutWaveWithWorkoutsMeasureModel> getWorkoutWaveWithWorkouts(
    int id,
  ) async =>
      handleError(
        () async {
          final query = select(workoutWaves).join([
            leftOuterJoin(
              workoutsInWaves,
              workoutsInWaves.workoutWaveId.equalsExp(workoutWaves.id),
            ),
            leftOuterJoin(
              workoutsWithMeasures,
              workoutsWithMeasures.id
                  .equalsExp(workoutsInWaves.workoutWithMeasureId),
            ),
            leftOuterJoin(
              workouts,
              workouts.id.equalsExp(workoutsWithMeasures.workoutId),
            ),
          ])
            ..where(workoutWaves.id.equals(id))
            ..orderBy([OrderingTerm.asc(workoutsInWaves.position)]);

          final result = await query.get();

          if (result.isEmpty) {
            final errorMsg =
                doesNotExistMsg("workout wave you're searching for");
            throw AppError(message: errorMsg);
          }

          final workoutWaveDetail = result.first.readTable(workoutWaves);

          final List<WorkoutsInWave> positionDetails = [];
          final List<WorkoutsWithMeasure> workoutsWithMeasureDetails = [];
          final List<Workout> workoutDetails = [];

          for (var row in result) {
            final positionDetail = row.readTableOrNull(workoutsInWaves);
            final countDetail = row.readTableOrNull(workoutsWithMeasures);
            final workoutDetail = row.readTableOrNull(workouts);

            if (positionDetail == null ||
                countDetail == null ||
                workoutDetail == null) continue;

            positionDetails.add(positionDetail);
            workoutsWithMeasureDetails.add(countDetail);
            workoutDetails.add(workoutDetail);
          }

          return WorkoutWaveWithWorkoutsMeasureModel.fromDbModel(
            positionDetails: positionDetails,
            workoutDetails: workoutDetails,
            workoutWaveDetail: workoutWaveDetail,
            workoutsWithMeasureDetails: workoutsWithMeasureDetails,
          );
        },
        "getting your workout wave",
      );

  Future<void> editWorkoutWaveWithWorkout(
    WorkoutWaveWithWorkoutsMeasureModel workoutWaveWithWorkoutMeasures,
  ) =>
      handleError(
        () async {
          await transaction(() async {
            // 1. Edit info about workoutWave
            await (update(workoutWaves)
                  ..where((tbl) => tbl.id
                      .equals(workoutWaveWithWorkoutMeasures.workoutWave.id)))
                .write(
                    workoutWaveWithWorkoutMeasures.workoutWave.toCompanion());

            // 2. Get any existing workoutWithMeasures
            final existingWorkoutsWithMeasures = await _getExistingWorkout(
              workoutWaveWithWorkoutMeasures.workoutsWithMeasure,
            );

            // 3. Delete all workoutWithMeasures mapped to this workoutWave
            await _deleteWorkoutsInWavesMapping(
              workoutWaveWithWorkoutMeasures.workoutWave.id,
            );

            final workoutWaveId = workoutWaveWithWorkoutMeasures.workoutWave.id;
            final workoutsWithMeasure =
                workoutWaveWithWorkoutMeasures.workoutsWithMeasure;

            // 4. Insert any new workoutsWithMeasure if required and return all the workoutsWithMeasure to be inserted
            final workoutsWithMeasureWithId =
                await _insertNewWorkoutWithMeasureReturning(
              workoutWaveId,
              existingWorkoutsWithMeasures,
              workoutsWithMeasure,
            );

            // 5. Map all workoutsWithMeasures to this workoutWave
            await _mapWorkoutsWithMeasureToWorkoutWave(
              workoutWaveId,
              workoutsWithMeasureWithId,
            );
          });
        },
        "editing your workout wave",
      );

  Future<void> _mapWorkoutsWithMeasureToWorkoutWave(
    int workoutWaveId,
    List<WorkoutWithMeasureModel> workoutsWithMeasure,
  ) =>
      handleError(
        () async {
          // 1. Convert each workoutWithMeasure to its corresponding companion
          final workoutsWithMeasureCompanions = workoutsWithMeasure
              .map((workoutWithMeasure) => WorkoutsInWavesCompanion(
                    position: Value(workoutWithMeasure.position),
                    workoutWaveId: Value(workoutWaveId),
                    workoutWithMeasureId: Value(workoutWithMeasure.id),
                  ))
              .toList();

          // 2. Insert all the companions in a batch
          await batch(
            (batch) async {
              batch.insertAll(workoutsInWaves, workoutsWithMeasureCompanions);
            },
          );
        },
        "processing your workout wave",
      );

  Future<List<WorkoutWithMeasureModel>> _insertNewWorkoutWithMeasureReturning(
    int workoutWaveId,
    List<WorkoutWithMeasureModel> existingWorkouts,
    List<WorkoutWithMeasureModel> workoutsWithMeasure,
  ) async =>
      handleError(
        () async {
          // 1. Insert all workoutsWithMeasure into map
          final existingWorkoutsMap = {
            for (var e in existingWorkouts) e.toMapKey(): e.id
          };

          final List<WorkoutWithMeasureModel> result = [];

          // 2. For each workoutWithMeasure:
          for (var workoutWithMeasure in workoutsWithMeasure) {
            if (!existingWorkoutsMap
                .containsKey(workoutWithMeasure.toMapKey())) {
              // if not exist then insert and get the result
              final inserted = await into(workoutsWithMeasures)
                  .insertReturning(workoutWithMeasure.toCompanion());
              result.add(workoutWithMeasure.copyWith(id: inserted.id));
              existingWorkoutsMap[workoutWithMeasure.toMapKey()] = inserted.id;
            } else {
              // other wise return the workoutWithMeasure with Id
              result.add(workoutWithMeasure.copyWith(
                id: existingWorkoutsMap[workoutWithMeasure.toMapKey()],
              ));
            }
          }
          return result;
        },
        "processing your workout wave",
      );

  Future<List<WorkoutWithMeasureModel>> _getExistingWorkout(
    List<WorkoutWithMeasureModel> workoutsWithMeasure,
  ) =>
      handleError(
        () async {
          // 1. From the workoutsWithMeasure given select all that exists in the table
          final existingResults = await (select(workoutsWithMeasures)
                ..where(
                  (tbl) {
                    // construct conditions for each column
                    final conditions = workoutsWithMeasure
                        .map(
                          (workoutWithMeasure) =>
                              tbl.repitition.equals(workoutWithMeasure.count) &
                              tbl.repititionType.equals(
                                  workoutWithMeasure.measure.toString()) &
                              tbl.workoutId
                                  .equals(workoutWithMeasure.workout.id),
                        )
                        .toList();
                    // reduce to a single condition
                    return conditions
                        .reduce((value, element) => value | element);
                  },
                ))
              .join([
            leftOuterJoin(
              workouts,
              workouts.id.equalsExp(workoutsWithMeasures.workoutId),
            ),
            leftOuterJoin(
              workoutsInWaves,
              workoutsInWaves.workoutWithMeasureId.equalsExp(
                workoutsWithMeasures.id,
              ),
            ),
          ]).get();

          final List<WorkoutWithMeasureModel> result = [];

          // 2. Get the joined details
          for (var row in existingResults) {
            final workoutMeasureData = row.readTable(workoutsWithMeasures);
            final workoutData = row.readTableOrNull(workouts);
            final positionData = row.readTableOrNull(workoutsInWaves);

            if (workoutData == null || positionData == null) continue;

            result.add(
              WorkoutWithMeasureModel.fromDbModel(
                workoutWithMeasure: workoutMeasureData,
                workout: workoutData,
                position: positionData.position,
              ),
            );
          }

          return result;
        },
        "processing your workout wave",
      );

  Future<void> deleteWorkoutWave(int workoutWaveId) async =>
      handleError(() async {
        await transaction(() async {
          // 1. Delete just the workoutWave info, since onDelete: Cascade, all mappings are deleted
          await (delete(workoutWaves)
                ..where((tbl) => tbl.id.equals(workoutWaveId)))
              .go();
        });
      }, "trying to delete your workout wave");

  Future<void> _deleteWorkoutsInWavesMapping(int workoutWaveId) async {
    await (delete(workoutsInWaves)
          ..where((tbl) => tbl.workoutWaveId.equals(workoutWaveId)))
        .go();
  }
}
