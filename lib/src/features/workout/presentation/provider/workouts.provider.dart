import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/watch_workouts.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workouts.provider.g.dart';

@riverpod
Stream<List<WorkoutDto>> workouts(Ref ref) {
  final workoutRepository = ref.watch(workoutImplProvider);

  final result = WatchWorkoutsUsecase(workoutRepository)();

  final workouts = result.map((workoutList) =>
      workoutList.map((workout) => WorkoutDto.fromEntity(workout)).toList());
  return workouts;
}
