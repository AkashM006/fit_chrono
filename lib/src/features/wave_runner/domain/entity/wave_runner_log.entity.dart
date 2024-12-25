import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class WaveRunnerLogEntity {
  final int id;
  final WorkoutWaveWithWorkoutsMeasureEntity workoutWaveWithWorkoutsMeasure;

  const WaveRunnerLogEntity({
    required this.id,
    required this.workoutWaveWithWorkoutsMeasure,
  });
}

class WorkoutWithWorkoutMeasureLogEntity {
  final WorkoutWithMeasureEntity workoutWithMeasure;
  final int elapsedTime;
  final bool wasSkipped;

  const WorkoutWithWorkoutMeasureLogEntity({
    required this.workoutWithMeasure,
    required this.elapsedTime,
    required this.wasSkipped,
  });
}
