import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutWaveEntity {
  final int id;
  final String name;
  final int times;

  const WorkoutWaveEntity({
    required this.id,
    required this.name,
    required this.times,
  });
}

class WorkoutWaveWithWorkoutsMeasureEntity {
  final WorkoutWaveEntity workoutWave;
  final List<WorkoutWithMeasureEntity> workoutsWithMeasure;

  const WorkoutWaveWithWorkoutsMeasureEntity({
    required this.workoutWave,
    required this.workoutsWithMeasure,
  });
}
