import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout_wave/data/modal/workout_wave.model.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout_wave.service.g.dart';

class WorkoutWaveService {
  final AppDatabase _database;

  const WorkoutWaveService(this._database);

  Stream<List<WorkoutWaveEntity>> watchWorkoutWaves() {
    return _database.workoutWaveDao.watchWorkoutWaves().map(
          (workoutWaves) => workoutWaves
              .map(
                (workoutWave) => workoutWave.toEntity(),
              )
              .toList(),
        );
  }

  Future<void> addWorkoutWave(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWaveWithWorkoutMeasures,
  ) {
    return _database.workoutWaveDao.addWorkoutWave(
      WorkoutWaveWithWorkoutsMeasureModel.fromEntity(
        workoutWaveWithWorkoutMeasures,
      ),
    );
  }

  Future<WorkoutWaveWithWorkoutsMeasureEntity> getWorkoutWaveWithWorkouts(
    int id,
  ) async {
    final result =
        await _database.workoutWaveDao.getWorkoutWaveWithWorkouts(id);
    return result.toEntity();
  }
}

@riverpod
WorkoutWaveService workoutWaveService(WorkoutWaveServiceRef ref) {
  final db = ref.watch(dbProvider);

  return WorkoutWaveService(db);
}
