import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class UpdateWorkoutUsecase
    extends Usecase<Future<DataState<void>>, WorkoutEntity> {
  @override
  Future<DataState<void>> call({required WorkoutEntity params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
