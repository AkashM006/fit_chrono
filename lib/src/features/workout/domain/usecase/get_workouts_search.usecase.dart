import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class GetWorkoutsSearchUsecase
    extends Usecase<Future<DataState<List<WorkoutEntity>>>, String> {
  final WorkoutRepository _workoutRepository;

  const GetWorkoutsSearchUsecase(this._workoutRepository);

  @override
  Future<DataState<List<WorkoutEntity>>> call({required String params}) =>
      _workoutRepository.getWorkoutsSearch(params);
}
