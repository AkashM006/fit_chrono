import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

abstract class WorkoutRepository {
  Stream<List<WorkoutEntity>> watchWorkouts();
}
