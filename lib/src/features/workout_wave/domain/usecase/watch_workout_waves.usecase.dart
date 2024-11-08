import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class WatchWorkoutWavesUsecase
    extends Usecase<Stream<List<WorkoutWaveEntity>>, void> {
  @override
  Stream<List<WorkoutWaveEntity>> call({required void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
