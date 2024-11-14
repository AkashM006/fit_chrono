import 'package:fit_chrono/src/features/workout_wave/data/data_sources/service/workout_wave.service.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/repository/workout_wave.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_wave_impl.repository.g.dart';

class WorkoutWaveImplRepository implements WorkoutWaveRepostiory {
  final WorkoutWaveService _workoutWaveService;

  const WorkoutWaveImplRepository(this._workoutWaveService);

  @override
  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves() {
    return _workoutWaveService.watchWorkoutWaves();
  }

  @override
  Future<void> addWorkoutWave(
      WorkoutWaveWithWorkoutsMeasureEntity workoutWave) {
    // TODO: implement addWorkoutWave
    throw UnimplementedError();
  }
}

@riverpod
WorkoutWaveImplRepository workoutWaveImplRepository(
  WorkoutWaveImplRepositoryRef ref,
) {
  final workoutWaveService = ref.watch(workoutWaveServiceProvider);

  return WorkoutWaveImplRepository(workoutWaveService);
}
