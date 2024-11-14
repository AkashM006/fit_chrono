import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class AddWorkoutWaveUsecase extends Usecase<Future<DataState<void>>,
    WorkoutWaveWithWorkoutsMeasureEntity> {
  final WorkoutWaveRepostiory _workoutWaveRepostiory;

  AddWorkoutWaveUsecase(this._workoutWaveRepostiory);

  @override
  Future<DataState<void>> call({
    required WorkoutWaveWithWorkoutsMeasureEntity params,
  }) {
    return _workoutWaveRepostiory.addWorkoutWave(params);
  }
}
