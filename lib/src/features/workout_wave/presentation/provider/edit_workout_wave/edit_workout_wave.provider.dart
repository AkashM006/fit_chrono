import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/edit_workout_wave.usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_workout_wave.provider.g.dart';

@riverpod
class EditWorkoutWave extends _$EditWorkoutWave {
  @override
  DataState<String>? build() => null;

  Future<void> go(
    WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkoutsMeasure,
  ) async {
    state = DataLoading();
    final workoutWaveRepository = ref.read(workoutWaveImplProvider);

    final result = await EditWorkoutWaveUsecase(workoutWaveRepository)(
      params: workoutWaveWithWorkoutsMeasure.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess(
        "🌊 Workout Wave updated! Keep pushing forward and make every rep count! 💪",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
