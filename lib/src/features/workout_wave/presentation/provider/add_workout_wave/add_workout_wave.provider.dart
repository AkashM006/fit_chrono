import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/add_workout_wave.usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_workout_wave.provider.g.dart';

@riverpod
class AddWorkoutWave extends _$AddWorkoutWave {
  @override
  DataState<String>? build() => null;

  void go(
    WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkoutsMeasure,
  ) async {
    state = DataLoading();

    await Future.delayed(const Duration(seconds: 5));

    final workoutWaveRepostiory = ref.read(workoutWaveImplRepositoryProvider);

    final result = await AddWorkoutWaveUsecase(workoutWaveRepostiory)(
      params: workoutWaveWithWorkoutsMeasure.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess("Added your workout wave"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
