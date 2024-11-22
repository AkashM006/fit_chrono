import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/delete_workout_wave.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_workout_wave.provider.g.dart';

@riverpod
class DeleteWorkoutWave extends _$DeleteWorkoutWave {
  @override
  DataState<String>? build() => null;

  void go(int workoutWaveId) async {
    state = DataLoading();

    await Future.delayed(const Duration(seconds: 14));

    final workoutWaveRepository = ref.read(workoutWaveImplProvider);

    final result = await DeleteWorkoutWaveUsecase(workoutWaveRepository)(
      params: workoutWaveId,
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess(
        "🌊 Workout Wave deleted! Clearing the way for new waves to conquer! 💥",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
