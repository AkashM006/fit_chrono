import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/service/muscle_map.service.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
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
  Future<DataState<void>> addMuscleMap(MuscleMapEntity muscleMap) {
    return safeExecute(
      () =>
          _muscleMapService.addMuscleMap(MuscleMapModel.fromEntity(muscleMap)),
    );
  }

  @override
  Future<MuscleMapEntity> getMuscleMap(int id) async {
    final result = await _muscleMapService.getMuscleMap(id);

    return result.toEntity();
  }

  @override
  Future<DataState<void>> updateMuscleMap(MuscleMapEntity newMuscleMap) {
    return safeExecute(
      () => _muscleMapService.updateMuscleMap(
        MuscleMapModel.fromEntity(newMuscleMap),
      ),
    );
  }

  @override
  Future<DataState<void>> deleteMuscleMap(int id) {
    return safeExecute(
      () => _muscleMapService.deleteMuscleMap(id),
    );
  }
}

@riverpod
MuscleMapImpl muscleMapImpl(MuscleMapImplRef ref) {
  final muscleMapService = ref.watch(muscleMapServiceProvider);

  return MuscleMapImpl(muscleMapService);
}
