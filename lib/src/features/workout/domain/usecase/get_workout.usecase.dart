import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class GetWorkoutUsecase extends Usecase<DataState<WorkoutEntity>, int> {
  @override
  DataState<WorkoutEntity> call({required int params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
