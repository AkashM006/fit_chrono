import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map.service.g.dart';

class MuscleMapService {
  final AppDatabase _appDatabase;

  MuscleMapService(this._appDatabase);

  Stream<List<MuscleMapModel>> watchMuscleMaps() {
    return _appDatabase.muscleMapDao.watchMuscleMaps().map(
          (muscleMaps) => muscleMaps
              .map(
                (muscleMap) => MuscleMapModel(
                  id: muscleMap.id,
                  name: muscleMap.name,
                ),
              )
              .toList(),
        );
  }

  Future<void> addMuscleMap(MuscleMapModel muscleMap) {
    return _appDatabase.muscleMapDao.addMuscleMap(
      MuscleMapsCompanion(
        name: Value(muscleMap.name),
      ),
    );
  }

  Future<MuscleMapModel?> getMuscleMap(int id) async {
    final result = await _appDatabase.muscleMapDao.getMuscleMap(id);

    if (result == null) return null;

    return MuscleMapModel(
      id: id,
      name: result.name,
    );
  }

  Future<void> updateMuscleMap(int id, String name) {
    return _appDatabase.muscleMapDao.updateMuscleMap(id, name);
  }
}

@riverpod
MuscleMapService muscleMapService(MuscleMapServiceRef ref) {
  final appDb = ref.watch(dbProvider);

  return MuscleMapService(appDb);
}
