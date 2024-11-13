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

class WorkoutWaveWithWorkoutsEntity {
  final WorkoutWaveEntity workoutWave;
  final List<WorkoutWithMeasureEntity> workoutsWithMeasurement;

  const WorkoutWaveWithWorkoutsEntity({
    required this.workoutWave,
    required this.workoutsWithMeasurement,
  });
}
