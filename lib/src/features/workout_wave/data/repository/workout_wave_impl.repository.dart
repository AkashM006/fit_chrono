import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/service/workout_wave.service.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_wave_impl.repository.g.dart';

class WorkoutWaveImplRepository extends BaseRepository
    implements WorkoutWaveRepostiory {
  final WorkoutWaveService _workoutWaveService;

  WorkoutWaveImplRepository(this._workoutWaveService);

  @override
  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves() =>
      _workoutWaveService.watchWorkoutWaves();

  @override
  Future<DataState<void>> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWave,
  ) =>
      safeExecute(
        () => _workoutWaveService.addWorkoutWave(workoutWave),
      );

  @override
  Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>>
      getWorkoutWaveWithWorkouts(int id) => safeExecute(
            () => _workoutWaveService.getWorkoutWaveWithWorkouts(id),
          );

  @override
  Future<DataState<void>> editWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWaveWithWorkoutMeasures,
  ) =>
      safeExecute(
        () => _workoutWaveService
            .editWorkoutWaveWithWorkouts(workoutWaveWithWorkoutMeasures),
      );

  @override
  Future<DataState<void>> deleteWorkoutWave(int workoutWaveId) => safeExecute(
        () => _workoutWaveService.deleteWorkoutWave(
          workoutWaveId,
        ),
      );
}

@riverpod
WorkoutWaveImplRepository workoutWaveImpl(
  WorkoutWaveImplRef ref,
) {
  final workoutWaveService = ref.watch(workoutWaveServiceProvider);

  return WorkoutWaveImplRepository(workoutWaveService);
}
