import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class WatchWorkoutWavesUsecase
    extends Usecase<Stream<List<WorkoutWaveEntity>>, void> {
  final WorkoutWaveRepostiory _workoutWaveRepostiory;

  const WatchWorkoutWavesUsecase(this._workoutWaveRepostiory);

  @override
  Stream<List<WorkoutWaveEntity>> call({void params}) =>
      _workoutWaveRepostiory.watchWorkoutWaves();
}
