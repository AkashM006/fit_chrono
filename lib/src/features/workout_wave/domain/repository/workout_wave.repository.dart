import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

abstract class WorkoutWaveRepostiory {
  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves();
  Stream<List<WorkoutWaveWithWorkoutsMeasureEntity>>
      watchWorkoutWaveWithWorkoutsMeasure();
  Future<DataState<void>> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWave,
  );
  Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>>
      getWorkoutWaveWithWorkouts(int id);
  Future<DataState<void>> editWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWave,
  );
  Future<DataState<void>> deleteWorkoutWave(int workoutWaveId);
}
