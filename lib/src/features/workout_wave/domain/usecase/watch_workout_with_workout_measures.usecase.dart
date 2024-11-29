import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class WatchWorkoutWithWorkoutMeasuresUsecase
    extends Usecase<Stream<List<WorkoutWaveWithWorkoutsMeasureEntity>>, void> {
  final WorkoutWaveRepostiory _workoutWaveRepostiory;

  const WatchWorkoutWithWorkoutMeasuresUsecase(this._workoutWaveRepostiory);

  @override
  Stream<List<WorkoutWaveWithWorkoutsMeasureEntity>> call({
    required void params,
  }) =>
      _workoutWaveRepostiory.watchWorkoutWaveWithWorkoutsMeasure();
}
