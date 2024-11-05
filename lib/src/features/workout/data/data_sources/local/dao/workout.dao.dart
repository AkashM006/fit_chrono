import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/muscle_maps_for_workouts.schema.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/workout.schema.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';

part 'workout.dao.g.dart';

@DriftAccessor(tables: [
  MuscleMaps,
  Workouts,
  MuscleMapsForWorkouts,
])
class WorkoutDao extends DatabaseAccessor<AppDatabase> with _$WorkoutDaoMixin {
  WorkoutDao(super.key);

  Stream<List<WorkoutModel>> watchWorkouts() {
    try {
      final query = select(workouts).join([
        leftOuterJoin(muscleMapsForWorkouts,
            muscleMapsForWorkouts.workoutId.equalsExp(workouts.id)),
        leftOuterJoin(muscleMaps,
            muscleMapsForWorkouts.muscleMapId.equalsExp(muscleMaps.id)),
      ]);

      return query.watch().map(
        (rows) {
          final groupedWorkouts = <int, WorkoutModel>{};

          for (final row in rows) {
            final workout = row.readTable(workouts);
            final muscleMap = row.readTableOrNull(muscleMaps);

            if (!groupedWorkouts.containsKey(workout.id)) {
              groupedWorkouts[workout.id] = WorkoutModel.fromDbModel(workout);
            }

            if (muscleMap == null) continue;

            groupedWorkouts[workout.id]!
                .muscles
                .add(MuscleMapModel.fromDbModel(muscleMap));
          }

          return groupedWorkouts.values.toList();
        },
      );
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("getting your workouts");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> addWorkout(WorkoutModel workout) async {
    try {
      await transaction(() async {
        final workoutId = await into(workouts).insert(
          workout.toCompanion(),
        );

        if (workout.muscles.isEmpty) return;

        await batch((batch) {
          batch.insertAll(
              muscleMapsForWorkouts,
              workout.muscles
                  .map(
                    (muscle) => MuscleMapsForWorkoutsCompanion.insert(
                      workoutId: workoutId,
                      muscleMapId: muscle.id,
                    ),
                  )
                  .toList());
        });
      });
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("adding your workout");
      throw AppError(message: errorMsg);
    }
  }

  Future<WorkoutModel> getWorkout(int id) async {
    try {
      final query = select(workouts).join([
        leftOuterJoin(muscleMapsForWorkouts,
            muscleMapsForWorkouts.workoutId.equalsExp(workouts.id)),
        leftOuterJoin(muscleMaps,
            muscleMapsForWorkouts.muscleMapId.equalsExp(muscleMaps.id)),
      ])
        ..where(workouts.id.equals(id));

      final result = await query.get();

      if (result.isEmpty) {
        final errorMsg = doesNotExistMsg("workout");
        throw AppError(message: errorMsg);
      }

      final workout = result.first.readTable(workouts);
      final List<MuscleMap> muscles = [];

      for (var row in result) {
        final muscleMap = row.readTableOrNull(muscleMaps);

        if (muscleMap != null) {
          muscles.add(muscleMap);
        }
      }

      final resultWorkout = WorkoutModel.fromDbModel(workout);
      final muscleModels =
          muscles.map((muscle) => MuscleMapModel.fromDbModel(muscle)).toList();

      resultWorkout.setMuscles(muscleModels);

      return resultWorkout;
    } catch (e) {
      if (e is AppError) {
        rethrow;
      }
      final errorMsg = somethingWentWrongMsg("getting your workout");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> updateWorkout(
    WorkoutModel workout,
  ) async {
    try {
      final query = (select(workouts)
        ..where(
          (tbl) => tbl.id.equals(workout.id),
        ));

      final result = await query.getSingleOrNull();

      if (result == null) {
        final errorMsg = doesNotExistMsg("workout you're trying update");
        throw AppError(
          message: errorMsg,
        );
      }

      await transaction(() async {
        await (update(workouts)
              ..where(
                (tbl) => tbl.id.equals(workout.id),
              ))
            .write(workout.toCompanion());

        await (delete(muscleMapsForWorkouts)
              ..where(
                (tbl) => tbl.workoutId.equals(workout.id),
              ))
            .go();

        await batch((batch) {
          batch.insertAll(
              muscleMapsForWorkouts,
              workout.muscles
                  .map(
                    (muscle) => MuscleMapsForWorkoutsCompanion.insert(
                      workoutId: workout.id,
                      muscleMapId: muscle.id,
                    ),
                  )
                  .toList());
        });
      });
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("updating your workout");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> deleteWorkout(int id) async {
    try {
      final query = (select(workouts)..where((tbl) => tbl.id.equals(id)));

      final workoutList = await query.get();

      if (workoutList.length > 1) {
        final errorMsg = multipleRecordsFound("delete your workout");
        throw AppError(message: errorMsg);
      }
      if (workoutList.isEmpty) {
        final errorMsg = doesNotExistMsg("workout you're trying to delete");
        throw AppError(message: errorMsg);
      }

      await transaction(() async {
        final workout = workoutList.first;

        await (delete(muscleMapsForWorkouts)
              ..where((tbl) => tbl.workoutId.equals(workout.id)))
            .go();

        await (delete(workouts)..where((tbl) => tbl.id.equals(id))).go();
      });
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("deleting your workout");
      throw AppError(message: errorMsg);
    }
  }
}
