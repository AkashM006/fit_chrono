import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/service/workout.service.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_impl.repository.g.dart';

class WorkoutImpl extends BaseRepository implements WorkoutRepository {
  final WorkoutService _workoutService;

  WorkoutImpl(this._workoutService);

  @override
  Stream<List<WorkoutEntity>> watchWorkouts() {
    return _workoutService.watchWorkouts();
  }
}

@riverpod
WorkoutImpl workoutImpl(WorkoutImplRef ref) {
  final workoutService = ref.watch(workoutServiceProvider);
  return WorkoutImpl(workoutService);
}
