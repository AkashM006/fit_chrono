import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class UpdateMuscleMapUsecase extends Usecase<void, MuscleMapEntity> {
  final MuscleMapRepository _muscleMapRepository;

  UpdateMuscleMapUsecase(this._muscleMapRepository);

  @override
  void call({required MuscleMapEntity params}) {
    _muscleMapRepository.updateMuscleMap(params);
  }
}
