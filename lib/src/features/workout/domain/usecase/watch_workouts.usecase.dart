import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class WatchWorkoutsUsecase extends Usecase<Stream<List<WorkoutEntity>>, void> {
  final WorkoutRepository _workoutRepository;

  const WatchWorkoutsUsecase(this._workoutRepository);

  @override
  Stream<List<WorkoutEntity>> call({void params}) {
    return _workoutRepository.watchWorkouts();
  }
}
