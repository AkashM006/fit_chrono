import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class DeleteMuscleMapUsecase extends Usecase<Future<DataState<void>>, int> {
  final MuscleMapRepository _muscleMapRepository;

  const DeleteMuscleMapUsecase(this._muscleMapRepository);

  @override
  Future<DataState<void>> call({required int params}) {
    return _muscleMapRepository.deleteMuscleMap(params);
  }
}
