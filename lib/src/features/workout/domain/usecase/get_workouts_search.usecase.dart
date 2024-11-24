import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class GetWorkoutsSearchUsecase
    extends Usecase<Future<DataState<List<WorkoutEntity>>>, String> {
  @override
  Future<DataState<List<WorkoutEntity>>> call({required String params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
