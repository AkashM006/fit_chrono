import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class AddWorkoutWaveUsecase
    extends Usecase<Future<DataState<void>>, WorkoutWaveWithWorkoutsEntity> {
  @override
  Future<DataState<void>> call(
      {required WorkoutWaveWithWorkoutsEntity params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
