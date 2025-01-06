import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/service/muscle_map.service.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/repository/muscle_map.repository.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map_impl.repository.g.dart';

class MuscleMapImpl extends BaseRepository implements MuscleMapRepository {
  final MuscleMapService _muscleMapService;

  const MuscleMapImpl(this._muscleMapService);

  @override
  Stream<List<MuscleMapEntity>> watchMuscleMaps() =>
      _muscleMapService.watchMuscleMaps();

  @override
  Future<DataState<void>> addMuscleMap(MuscleMapEntity muscleMap) =>
      safeExecute(
        () => _muscleMapService.addMuscleMap(muscleMap),
      );

  @override
  Future<DataState<MuscleMapEntity>> getMuscleMap(int id) =>
      safeExecute(() => _muscleMapService.getMuscleMap(id));

  @override
  Future<DataState<void>> editMuscleMap(MuscleMapEntity newMuscleMap) =>
      safeExecute(
        () => _muscleMapService.editMuscleMap(
          newMuscleMap,
        ),
      );

  @override
  Future<DataState<void>> deleteMuscleMap(int id) => safeExecute(
        () => _muscleMapService.deleteMuscleMap(id),
      );
}

@riverpod
MuscleMapImpl muscleMapImpl(Ref ref) {
  final muscleMapService = ref.watch(muscleMapServiceProvider);

  return MuscleMapImpl(muscleMapService);
}
