import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';

class WatchWorkoutsSearchUsecase
    extends Usecase<Stream<List<WorkoutEntity>>, String> {
  final WorkoutRepository _workoutRepository;

  const WatchWorkoutsSearchUsecase(this._workoutRepository);

  @override
  Stream<List<WorkoutEntity>> call({required String params}) =>
      _workoutRepository.watchWorkoutsSearch(params);
}
