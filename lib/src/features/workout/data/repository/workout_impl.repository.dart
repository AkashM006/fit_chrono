import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/service/workout.service.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:fit_chrono/src/features/workout/domain/repository/workout.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_impl.repository.g.dart';

class WorkoutImpl extends BaseRepository implements WorkoutRepository {
  final WorkoutService _workoutService;

  const WorkoutImpl(this._workoutService);

  @override
  Stream<List<WorkoutEntity>> watchWorkouts() =>
      _workoutService.watchWorkouts();

  @override
  Future<DataState<void>> addWorkout(WorkoutEntity workout) => safeExecute(
        () => _workoutService.addWorkout(workout),
      );

  @override
  Future<DataState<WorkoutEntity>> getWorkout(int id) => safeExecute(
        () => _workoutService.getWorkout(id),
      );

  @override
  Future<DataState<void>> editWorkout(
    WorkoutEntity workout,
  ) =>
      safeExecute(
        () => _workoutService.editWorkout(workout),
      );

  @override
  Future<DataState<void>> deleteWorkout(int id) => safeExecute(
        () => _workoutService.deleteWorkout(id),
      );

  @override
  Stream<List<WorkoutEntity>> watchWorkoutsSearch(String workoutName) =>
      _workoutService.watchWorkoutsSearch(workoutName);

  @override
  Future<DataState<List<WorkoutEntity>>> getWorkoutsSearch(
    String workoutName,
  ) =>
      safeExecute(
        () => _workoutService.getWorkoutsSearch(workoutName),
      );
}

@riverpod
WorkoutImpl workoutImpl(Ref ref) {
  final workoutService = ref.watch(workoutServiceProvider);
  return WorkoutImpl(workoutService);
}
