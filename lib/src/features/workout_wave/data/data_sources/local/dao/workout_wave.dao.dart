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

  Future<void> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureModel workoutWaveWithWorkoutMeasures,
  ) async {
    return handleError(() async {
      await transaction(() async {
        // 1. first insert the workout wave and get the id
        final workoutWaveId = await (into(workoutWaves)
            .insert(workoutWaveWithWorkoutMeasures.workoutWave.toCompanion()));
        // 2. then insert the workouts with their measurements and get all their ids
        // Check the workout with measure that are already present in db and get their ids
        final workoutMeasuresCompanions = workoutWaveWithWorkoutMeasures
            .workouts
            .map((workoutWithMeasure) => workoutWithMeasure.toCompanion())
            .toList();

        final conditions = workoutMeasuresCompanions
            .map(
              (workoutWithMeasure) =>
                  workoutsWithMeasures.workoutId
                      .equals(workoutWithMeasure.workoutId.value) &
                  workoutsWithMeasures.repitition
                      .equals(workoutWithMeasure.repitition.value) &
                  workoutsWithMeasures.repititionType
                      .equals(workoutWithMeasure.repititionType.value),
            )
            .toList();

        final List<WorkoutWithMeasureModel> existingWorkoutsWithMeasureList =
            [];
        final existingCheckResult = await (select(workoutsWithMeasures)
              ..where((tbl) => conditions.reduce((prev, expr) => prev | expr)))
            .join([
          leftOuterJoin(
            workouts,
            workoutsWithMeasures.workoutId.equalsExp(workouts.id),
          )
        ]).get();

        // since the model requires data from two tables, joining them and constructing it
        for (var row in existingCheckResult) {
          final workoutMeasureData = row.readTable(workoutsWithMeasures);
          final workoutData = row.readTableOrNull(workouts);

          if (workoutData == null) continue;

          final workoutWithMeasure = WorkoutWithMeasureModel.fromDbModel(
            workoutWithMeasure: workoutMeasureData,
            workout: workoutData,
          );

          existingWorkoutsWithMeasureList.add(workoutWithMeasure);
        }

        final existingWorkoutsWithMeasureMap = {
          for (var workoutWithMeasure in existingWorkoutsWithMeasureList)
            workoutWithMeasure: workoutWithMeasure.id
        };

        final workoutsWithMeasureList = workoutWaveWithWorkoutMeasures.workouts;
        for (var workoutWithMeasure in workoutsWithMeasureList) {
          if (!existingWorkoutsWithMeasureMap.containsKey(workoutWithMeasure)) {
            // add new workout with measure here and store the id
            // otherwise insert them and get the ids
            final inserted = await into(workoutsWithMeasures)
                .insertReturning(workoutWithMeasure.toCompanion());
            existingWorkoutsWithMeasureList.add(
              workoutWithMeasure.copyWith(id: inserted.id),
            );
          }
        }
        // then insert into relationship table
        final workoutWaveWithWorkoutsMeasureCompanions =
            existingWorkoutsWithMeasureList
                .map(
                  (workoutWithMeasure) => WorkoutsInWavesCompanion(
                    position: Value(workoutWithMeasure.position),
                    workoutId: Value(workoutWithMeasure.workout.id),
                    workoutWaveId: Value(workoutWaveId),
                  ),
                )
                .toList();
        await batch((batch) {
          batch.insertAll(
            workoutsInWaves,
            workoutWaveWithWorkoutsMeasureCompanions,
          );
        });
      });
    }, "adding your workout wave");
  }
}
