import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class GetMuscleMapUsecase extends Usecase<Future<MuscleMapEntity?>, int> {
  final MuscleMapRepository _muscleMapRepository;

  GetMuscleMapUsecase(this._muscleMapRepository);

  @override
  Future<MuscleMapEntity?> call({required int params}) {
    return _muscleMapRepository.getMuscleMap(params);
  }
}
