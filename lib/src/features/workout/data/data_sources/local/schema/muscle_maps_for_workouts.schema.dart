import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/workout.schema.dart';

class MuscleMapsForWorkouts extends Table {
  IntColumn get workoutId => integer().references(
        Workouts,
        #id,
        onDelete: KeyAction.cascade,
      )();
  IntColumn get muscleMapId => integer().references(
        MuscleMaps,
        #id,
        onDelete: KeyAction.cascade,
      )();

  @override
  Set<Column> get primaryKey => {workoutId, muscleMapId};
}
