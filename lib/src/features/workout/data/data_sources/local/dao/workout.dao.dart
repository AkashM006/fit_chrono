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
          final muscleMap = row.readTable(muscleMaps);

          if (!groupedWorkouts.containsKey(workout.id)) {
            groupedWorkouts[workout.id] = WorkoutModel.fromDbModel(workout);
          }

          groupedWorkouts[workout.id]!
              .muscles
              .add(MuscleMapModel.fromDbModel(muscleMap));
        }

        return groupedWorkouts.values.toList();
      },
    );
  }

  Future<void> addWorkout(WorkoutModel workout) async {
    try {
      await transaction(() async {
        final workoutId = await into(workouts).insert(
          WorkoutsCompanion.insert(
            name: workout.name,
            repitition: workout.count,
            repititionType: workout.measure.toString(),
          ),
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
}
