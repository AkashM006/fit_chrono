import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/muscle_map/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_map/domain/repository/muscle_map.repository.dart';

class WatchMuscleMapUsecase
    extends Usecase<Stream<List<MuscleMapEntity>>, void> {
  final MuscleMapRepository _muscleMapRepository;

  WatchMuscleMapUsecase(this._muscleMapRepository);

  @override
  Stream<List<MuscleMapEntity>> call({required void params}) {
    return _muscleMapRepository.watchMuscleMaps();
  }
}
