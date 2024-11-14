import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

abstract class WorkoutWaveRepostiory {
  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves();
  Future<void> addWorkoutWave(WorkoutWaveWithWorkoutsMeasureEntity workoutWave);
}
