import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class DeleteWorkoutUsecase extends Usecase<Future<DataState<void>>, int> {
  final WorkoutRepository _workoutRepository;

  const DeleteWorkoutUsecase(this._workoutRepository);

  @override
  Future<DataState<void>> call({required int params}) =>
      _workoutRepository.deleteWorkout(params);
}
