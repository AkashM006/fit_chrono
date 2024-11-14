import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class AddWorkoutUsecase
    extends Usecase<Future<DataState<void>>, WorkoutEntity> {
  final WorkoutRepository _workoutRepository;

  const AddWorkoutUsecase(this._workoutRepository);

  @override
  Future<DataState<void>> call({required WorkoutEntity params}) {
    return _workoutRepository.addWorkout(params);
  }
}
