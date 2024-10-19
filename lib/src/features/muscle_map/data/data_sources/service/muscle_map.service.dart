import 'package:fit_chrono/src/features/muscle_map/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_map.service.g.dart';

class MuscleMapService {
  final AppDatabase _appDatabase;

  MuscleMapService(this._appDatabase);

  Stream<List<MuscleMapModel>> watchMuscleMaps() {
    return _appDatabase.muscleMapsDao.watchMuscleMaps().map(
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
}

@riverpod
MuscleMapService muscleMapService(MuscleMapServiceRef ref) {
  final appDb = ref.watch(dbProvider);

  return MuscleMapService(appDb);
}
