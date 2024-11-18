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
  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves() {
    return _workoutWaveService.watchWorkoutWaves();
  }

  @override
  Future<DataState<void>> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWave,
  ) {
    return safeExecute(
      () => _workoutWaveService.addWorkoutWave(workoutWave),
    );
  }

  @override
  Future<DataState<WorkoutWaveWithWorkoutsMeasureEntity>>
      getWorkoutWaveWithWorkouts(int id) async {
    return safeExecute(
      () => _workoutWaveService.getWorkoutWaveWithWorkouts(id),
    );
  }
}

@riverpod
WorkoutWaveImplRepository workoutWaveImpl(
  WorkoutWaveImplRef ref,
) {
  final workoutWaveService = ref.watch(workoutWaveServiceProvider);

  return WorkoutWaveImplRepository(workoutWaveService);
}
