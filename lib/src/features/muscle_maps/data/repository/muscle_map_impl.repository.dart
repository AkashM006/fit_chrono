import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/service/muscle_map.service.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base_db.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map_impl.repository.g.dart';

class MuscleMapImpl extends BaseDbRepository implements MuscleMapRepository {
  final MuscleMapService _muscleMapService;

  MuscleMapImpl(this._muscleMapService);

  @override
  Stream<List<MuscleMapModel>> watchMuscleMaps() {
    return _muscleMapService.watchMuscleMaps();
  }

  @override
  Future<DataState<void>> addMuscleMap(String name) {
    return safeExecute(
      () => _muscleMapService.addMuscleMap(name),
    );
  }
}

@riverpod
MuscleMapImpl muscleMapImpl(MuscleMapImplRef ref) {
  final muscleMapService = ref.watch(muscleMapServiceProvider);

  return MuscleMapImpl(muscleMapService);
}
