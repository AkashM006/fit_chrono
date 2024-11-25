import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map.service.g.dart';

class MuscleMapService {
  final AppDatabase _appDatabase;

  MuscleMapService(this._appDatabase);

  Stream<List<MuscleMapEntity>> watchMuscleMaps() {
    return _appDatabase.muscleMapDao.watchMuscleMaps().map(
          (muscleMapList) => muscleMapList
              .map(
                (muscleMap) => muscleMap.toEntity(),
              )
              .toList(),
        );
  }

  Future<void> addMuscleMap(MuscleMapEntity muscleMap) {
    return _appDatabase.muscleMapDao
        .addMuscleMap(MuscleMapModel.fromEntity(muscleMap));
  }

  Future<MuscleMapEntity> getMuscleMap(int id) async {
    final result = await _appDatabase.muscleMapDao.getMuscleMap(id);

    return result.toEntity();
  }

  Future<void> editMuscleMap(MuscleMapEntity muscleMap) async {
    await _appDatabase.muscleMapDao.editMuscleMap(
      muscleMap.id,
      MuscleMapModel.fromEntity(muscleMap),
    );
  }

  Future<void> deleteMuscleMap(int id) {
    return _appDatabase.muscleMapDao.deleteMuscleMap(id);
  }
}

@riverpod
MuscleMapService muscleMapService(Ref ref) {
  final appDb = ref.watch(dbProvider);

  return MuscleMapService(appDb);
}
