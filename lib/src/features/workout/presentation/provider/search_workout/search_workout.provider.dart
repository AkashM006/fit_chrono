import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/get_workouts_search.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'search_workout.provider.g.dart';

@riverpod
Future<List<WorkoutDto>> searchWorkouts(
  Ref ref,
  String workoutName,
) async {
  final workoutRepository = ref.watch(workoutImplProvider);

  final result =
      await GetWorkoutsSearchUsecase(workoutRepository)(params: workoutName);

  return result.fold(
    onSuccess: (data) =>
        data.map((workout) => WorkoutDto.fromEntity(workout)).toList(),
    onFailure: (error) {
      throw error;
    },
  );
}
