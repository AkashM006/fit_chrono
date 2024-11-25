import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class EditMuscleMapUsecase
    extends Usecase<Future<DataState<void>>, MuscleMapEntity> {
  final MuscleMapRepository _muscleMapRepository;

  const EditMuscleMapUsecase(this._muscleMapRepository);

  @override
  Future<DataState<void>> call({required MuscleMapEntity params}) {
    return _muscleMapRepository.editMuscleMap(params);
  }
}
