import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WatchWorkoutsSearchUsecase
    extends Usecase<Stream<List<WorkoutEntity>>, String> {
  @override
  Stream<List<WorkoutEntity>> call({required String params}) {
    // TODO: implement call
    throw UnimplementedError();
  }
}
