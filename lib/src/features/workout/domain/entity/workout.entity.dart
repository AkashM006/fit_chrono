import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class WorkoutEntity {
  final int id;
  final String name;
  final List<MuscleMapEntity> muscles;

  const WorkoutEntity({
    required this.id,
    required this.name,
    required this.muscles,
  });
}

class WorkoutWithMeasureEntity {
  final int id;
  final WorkoutEntity workout;
  final WorkoutMeasureEntity workoutMeasure;
  final int count;
  final int position;

  const WorkoutWithMeasureEntity({
    required this.id,
    required this.workout,
    required this.workoutMeasure,
    required this.count,
    required this.position,
  });
}

enum WorkoutMeasureEntity {
  time,
  reps,
}
