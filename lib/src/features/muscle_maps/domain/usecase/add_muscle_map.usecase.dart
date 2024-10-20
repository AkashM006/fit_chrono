import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';

class AddMuscleMapUsecase extends Usecase<void, String> {
  final MuscleMapRepository _muscleMapRepository;

  AddMuscleMapUsecase(this._muscleMapRepository);

  @override
  void call({required String params}) {
    _muscleMapRepository.addMuscleMap(params);
  }
}
