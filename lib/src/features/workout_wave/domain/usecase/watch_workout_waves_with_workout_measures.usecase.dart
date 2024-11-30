import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';

class WatchWorkoutWavesWithWorkoutMeasuresUsecase
    extends Usecase<Stream<List<WorkoutWaveWithWorkoutsMeasureEntity>>, void> {
  final WorkoutWaveRepostiory _workoutWaveRepository;

  const WatchWorkoutWavesWithWorkoutMeasuresUsecase(
      this._workoutWaveRepository);

  @override
  Stream<List<WorkoutWaveWithWorkoutsMeasureEntity>> call({
    required void params,
  }) =>
      _workoutWaveRepository.watchWorkoutWaveWithWorkoutsMeasure();
}
