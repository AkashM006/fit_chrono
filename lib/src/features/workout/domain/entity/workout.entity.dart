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
  final WorkoutEntity workoutEntity;
  final int count;

  const WorkoutWithMeasureEntity({
    required this.id,
    required this.workoutEntity,
    required this.count,
  });
}

enum WorkoutMeasureEntity {
  time,
  reps,
}
