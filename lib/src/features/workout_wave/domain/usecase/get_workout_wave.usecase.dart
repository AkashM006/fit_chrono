import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class GetWorkoutWaveUsecase extends Usecase<
    Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>>, int> {
  @override
  Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>> call({
    required int params,
  }) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
