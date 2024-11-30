import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/watch_workout_waves_with_workout_measures.usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_waves.provider.g.dart';

@riverpod
Stream<List<WorkoutWaveWithWorkoutsMeasureDto>> workoutWaves(Ref ref) {
  final workoutWaveRepository = ref.watch(workoutWaveImplProvider);

  final result =
      WatchWorkoutWavesWithWorkoutMeasuresUsecase(workoutWaveRepository)(
          params: null);

  return result
      .map((workoutWavesWithWorkoutMeasure) => workoutWavesWithWorkoutMeasure
          .map(
            (workoutWaveWithWorkoutMeasure) =>
                WorkoutWaveWithWorkoutsMeasureDto.fromEntity(
              workoutWaveWithWorkoutMeasure,
            ),
          )
          .toList());
}
