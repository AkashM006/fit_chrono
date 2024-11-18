import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class GetWorkoutWaveUsecase extends Usecase<
    Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>>, int> {
  final WorkoutWaveRepostiory _workoutWaveRepostiory;

  const GetWorkoutWaveUsecase(this._workoutWaveRepostiory);

  @override
  Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>> call({
    required int params,
  }) {
    return _workoutWaveRepostiory.getWorkoutWaveWithWorkouts(params);
  }
}
