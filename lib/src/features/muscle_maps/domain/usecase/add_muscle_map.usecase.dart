import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class AddMuscleMapUsecase extends Usecase<Future<DataState<void>>, String> {
  final MuscleMapRepository _muscleMapRepository;

  AddMuscleMapUsecase(this._muscleMapRepository);

  @override
  Future<DataState<void>> call({required String params}) {
    return _muscleMapRepository.addMuscleMap(params);
  }
}
