import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class WorkoutEntity {
  final int id;
  final String name;
  final List<MuscleMapEntity> muscles;
  final WorkoutMeasureEntity measure;
  final int count;

  const WorkoutEntity({
    required this.id,
    required this.name,
    required this.muscles,
    required this.measure,
    required this.count,
  });
}

enum WorkoutMeasureEntity {
  time,
  reps,
}
