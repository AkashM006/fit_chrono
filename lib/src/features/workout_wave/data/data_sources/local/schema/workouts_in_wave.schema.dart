import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/workout.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';

class WorkoutsInWaves extends Table {
  IntColumn get workoutWithMeasureId => integer().references(
        Workouts,
        #id,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get workoutWaveId => integer().references(
        WorkoutWaves,
        #id,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get position => integer()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {
          workoutWithMeasureId,
          workoutWaveId,
          position,
        },
      ];
}
