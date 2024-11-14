import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class GetWorkoutUsecase extends Usecase<Future<DataState<WorkoutEntity>>, int> {
  final WorkoutRepository _workoutRepository;

  const GetWorkoutUsecase(this._workoutRepository);

  @override
  Future<DataState<WorkoutEntity>> call({required int params}) {
    return _workoutRepository.getWorkout(params);
  }
}
