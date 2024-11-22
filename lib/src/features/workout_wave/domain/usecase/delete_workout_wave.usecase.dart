import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class DeleteWorkoutWaveUsecase extends Usecase<Future<DataState<void>>, int> {
  final WorkoutWaveRepostiory _workoutWaveRepostiory;

  const DeleteWorkoutWaveUsecase(this._workoutWaveRepostiory);

  @override
  Future<DataState<void>> call({required int params}) =>
      _workoutWaveRepostiory.deleteWorkoutWave(params);
}
