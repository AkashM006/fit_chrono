import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/watch_workouts_search.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_workout.provider.g.dart';

@riverpod
Stream<List<WorkoutDto>> searchWorkouts(
  SearchWorkoutsRef ref,
  String workoutName,
) {
  final workoutRepository = ref.watch(workoutImplProvider);

  final result =
      WatchWorkoutsSearchUsecase(workoutRepository)(params: workoutName);

  return result.map(
    (workoutList) => workoutList
        .map(
          (workout) => WorkoutDto.fromEntity(workout),
        )
        .toList(),
  );
}
