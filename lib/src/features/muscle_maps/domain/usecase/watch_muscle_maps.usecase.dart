import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class WatchMuscleMapsUsecase
    extends Usecase<Stream<List<MuscleMapEntity>>, void> {
  final MuscleMapRepository _muscleMapRepository;

  const WatchMuscleMapsUsecase(this._muscleMapRepository);

  @override
  Stream<List<MuscleMapEntity>> call({void params}) =>
      _muscleMapRepository.watchMuscleMaps();
}
