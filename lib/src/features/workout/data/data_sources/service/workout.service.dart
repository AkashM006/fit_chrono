import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout.service.g.dart';

class WorkoutService {
  final AppDatabase _appDatabase;

  WorkoutService(this._appDatabase);

  Stream<List<WorkoutEntity>> watchWorkouts() {
    return _appDatabase.workoutDao.watchWorkouts().map(
          (workouts) => workouts
              .map(
                (workout) => workout.toEntity(),
              )
              .toList(),
        );
  }

  Future<void> addWorkout(WorkoutEntity workout) async {
    await _appDatabase.workoutDao.addWorkout(WorkoutModel.fromEntity(workout));
  }

  Future<WorkoutEntity> getWorkout(int id) async {
    final result = await _appDatabase.workoutDao.getWorkout(id);
    return result.toEntity();
  }

  Future<void> updateWorkout(
    WorkoutEntity workout,
  ) async {
    await _appDatabase.workoutDao
        .updateWorkout(WorkoutModel.fromEntity(workout));
  }

  Future<void> deleteWorkout(int id) {
    return _appDatabase.workoutDao.deleteWorkout(id);
  }
}

@riverpod
WorkoutService workoutService(WorkoutServiceRef ref) {
  final db = ref.watch(dbProvider);

  return WorkoutService(db);
}
