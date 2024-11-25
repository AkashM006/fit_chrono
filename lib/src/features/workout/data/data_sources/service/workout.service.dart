import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'workout.service.g.dart';

class WorkoutService {
  final AppDatabase _appDatabase;

  WorkoutService(this._appDatabase);

  Stream<List<WorkoutEntity>> watchWorkouts() =>
      _appDatabase.workoutDao.watchWorkouts().map(modelListToEntityList);

  Future<void> addWorkout(WorkoutEntity workout) async {
    await _appDatabase.workoutDao.addWorkout(WorkoutModel.fromEntity(workout));
  }

  Future<WorkoutEntity> getWorkout(int id) async {
    final result = await _appDatabase.workoutDao.getWorkout(id);
    return result.toEntity();
  }

  Future<void> editWorkout(
    WorkoutEntity workout,
  ) async =>
      _appDatabase.workoutDao.editWorkout(WorkoutModel.fromEntity(workout));

  Future<void> deleteWorkout(int id) =>
      _appDatabase.workoutDao.deleteWorkout(id);

  Stream<List<WorkoutEntity>> watchWorkoutsSearch(String name) =>
      _appDatabase.workoutDao
          .watchWorkoutsSearch(name)
          .map(modelListToEntityList);

  Future<List<WorkoutEntity>> getWorkoutsSearch(String workoutName) =>
      _appDatabase.workoutDao
          .getWorkoutsSearch(workoutName)
          .then(modelListToEntityList);
}

List<WorkoutEntity> modelListToEntityList(List<WorkoutModel> list) =>
    list.map((item) => item.toEntity()).toList();

@riverpod
WorkoutService workoutService(Ref ref) {
  final db = ref.watch(dbProvider);

  return WorkoutService(db);
}
