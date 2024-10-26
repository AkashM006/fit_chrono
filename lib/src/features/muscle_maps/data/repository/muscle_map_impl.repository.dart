import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/service/muscle_map.service.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map_impl.repository.g.dart';

class MuscleMapImpl extends BaseRepository implements MuscleMapRepository {
  final MuscleMapService _muscleMapService;

  MuscleMapImpl(this._muscleMapService);

  @override
  Stream<List<MuscleMapEntity>> watchMuscleMaps() {
    return _muscleMapService.watchMuscleMaps().map(
      (muscleMapModelList) {
        return muscleMapModelList
            .map(
              (e) => e.toEntity(),
            )
            .toList();
      },
    );
  }

  @override
  Future<DataState<void>> addMuscleMap(String name) {
    return safeExecute(
      () => _muscleMapService.addMuscleMap(name),
    );
  }

  @override
  Future<DataState<MuscleMapEntity?>> getMuscleMap(int id) {
    return safeExecute(
      () async {
        final result = await _muscleMapService.getMuscleMap(id);

        return result?.toEntity();
      },
    );
  }

  @override
  Future<DataState<void>> updateMuscleMap(MuscleMapEntity newMuscleMap) {
    return safeExecute(
      () =>
          _muscleMapService.updateMuscleMap(newMuscleMap.id, newMuscleMap.name),
    );
  }
}

@riverpod
MuscleMapImpl muscleMapImpl(MuscleMapImplRef ref) {
  final muscleMapService = ref.watch(muscleMapServiceProvider);

  return MuscleMapImpl(muscleMapService);
}
