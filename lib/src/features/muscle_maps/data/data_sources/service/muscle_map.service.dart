import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map.service.g.dart';

class MuscleMapService {
  final AppDatabase _appDatabase;

  MuscleMapService(this._appDatabase);

  Stream<List<MuscleMapModel>> watchMuscleMaps() {
    return _appDatabase.muscleMapDao.watchMuscleMaps();
  }

  Future<void> addMuscleMap(MuscleMapModel muscleMap) {
    return _appDatabase.muscleMapDao.addMuscleMap(muscleMap);
  }

  Future<MuscleMapModel> getMuscleMap(int id) {
    return _appDatabase.muscleMapDao.getMuscleMap(id);
  }

  Future<void> updateMuscleMap(MuscleMapModel muscleMap) async {
    await _appDatabase.muscleMapDao.updateMuscleMap(
      muscleMap.id,
      muscleMap,
    );
  }

  Future<void> deleteMuscleMap(int id) {
    return _appDatabase.muscleMapDao.deleteMuscleMap(id);
  }
}

@riverpod
MuscleMapService muscleMapService(MuscleMapServiceRef ref) {
  final appDb = ref.watch(dbProvider);

  return MuscleMapService(appDb);
}
