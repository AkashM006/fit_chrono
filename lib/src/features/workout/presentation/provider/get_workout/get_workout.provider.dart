import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/data/repository/workout_impl.repository.dart';
import 'package:fit_chrono/src/features/workout/domain/usecase/get_workout.usecase.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout.provider.g.dart';

@riverpod
Future<WorkoutDto> getWorkout(GetWorkoutRef ref, int id) async {
  final workoutRepository = ref.watch(workoutImplProvider);

  final result = await GetWorkoutUsecase(workoutRepository)(params: id);

  return result.fold(
    onSuccess: (data) => WorkoutDto.fromEntity(data),
    onFailure: (error) => throw error,
  );
}
