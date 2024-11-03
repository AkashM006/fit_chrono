import 'package:fit_chrono/src/core/utils/data_state.util.dart';
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

  @override
  Future<DataState<void>> addWorkout(WorkoutEntity workout) {
    return safeExecute(
      () => _workoutService.addWorkout(workout),
    );
  }

  @override
  Future<DataState<WorkoutEntity>> getWorkout(int id) {
    return safeExecute(
      () => _workoutService.getWorkout(id),
    );
  }

  @override
  Future<DataState<void>> updateWorkout(WorkoutEntity workout) {
    // TODO: implement updateWorkout
    throw UnimplementedError();
  }
}

@riverpod
WorkoutImpl workoutImpl(WorkoutImplRef ref) {
  final workoutService = ref.watch(workoutServiceProvider);
  return WorkoutImpl(workoutService);
}
