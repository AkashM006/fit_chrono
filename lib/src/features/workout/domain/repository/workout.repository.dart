import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

abstract class WorkoutRepository {
  Stream<List<WorkoutEntity>> watchWorkouts();
  Future<DataState<void>> addWorkout(WorkoutEntity workout);
  Future<DataState<WorkoutEntity>> getWorkout(int id);
  Future<DataState<void>> updateWorkout(
    WorkoutEntity workout,
    bool hasUpdatedMuscles,
  );
}
