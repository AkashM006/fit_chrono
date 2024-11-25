import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout_wave/data/repository/workout_wave_impl.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/usecase/get_workout_wave.usecase.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_workout_wave.provider.g.dart';

@riverpod
Future<WorkoutWaveWithWorkoutsMeasureDto> getWorkoutWave(
  Ref ref,
  int id,
) async {
  final workoutWaveRepository = ref.watch(workoutWaveImplProvider);

  final result = await GetWorkoutWaveUsecase(workoutWaveRepository)(params: id);

  return result.fold(
    onSuccess: (data) => WorkoutWaveWithWorkoutsMeasureDto.fromEntity(data),
    onFailure: (error) => throw error,
  );
}
