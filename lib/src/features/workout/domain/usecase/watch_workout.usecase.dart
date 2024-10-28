import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WatchWorkoutUsecase extends Usecase<Stream<List<WorkoutEntity>>, void> {
  @override
  Stream<List<WorkoutEntity>> call({required void params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
