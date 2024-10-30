import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
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

  Future<void> addWorkout(WorkoutEntity workout) async {}
}

@riverpod
WorkoutService workoutService(WorkoutServiceRef ref) {
  final db = ref.watch(dbProvider);

  return WorkoutService(db);
}
