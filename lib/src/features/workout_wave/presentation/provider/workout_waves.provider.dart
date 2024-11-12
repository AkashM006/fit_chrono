import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/watch_workout_waves.usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_waves.provider.g.dart';

@riverpod
Stream<List<WorkoutWaveDto>> workoutWaves(WorkoutWavesRef ref) {
  final workoutWaveRepository = ref.watch(workoutWaveImplRepositoryProvider);

  final result = WatchWorkoutWavesUsecase(workoutWaveRepository)();

  return result.map(
    (workoutWaves) => workoutWaves
        .map(
          (workoutWave) => WorkoutWaveDto.fromEntity(workoutWave),
        )
        .toList(),
  );
}
