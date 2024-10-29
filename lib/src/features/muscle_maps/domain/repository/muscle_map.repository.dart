import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

abstract class MuscleMapRepository {
  Stream<List<MuscleMapEntity>> watchMuscleMaps();
  Future<DataState<void>> addMuscleMap(MuscleMapEntity muscleMap);
  Future<DataState<MuscleMapEntity>> getMuscleMap(int id);
  Future<DataState<void>> updateMuscleMap(MuscleMapEntity newMuscleMap);
  Future<DataState<void>> deleteMuscleMap(int id);
}
