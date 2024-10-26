import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

part 'muscle_map.dao.g.dart';

@DriftAccessor(tables: [MuscleMaps])
class MuscleMapDao extends DatabaseAccessor<AppDatabase>
    with _$MuscleMapDaoMixin {
  MuscleMapDao(super.key);

  Stream<List<MuscleMap>> watchMuscleMaps() {
    return select(muscleMaps).watch();
  }

  Future<void> addMuscleMap(MuscleMapModel muscleMap) async {
    await into(muscleMaps).insert(
      MuscleMapsCompanion(
        name: Value(muscleMap.name),
      ),
    );
  }

  Future<MuscleMap?> getMuscleMap(int id) async {
    return (select(muscleMaps)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .getSingle();
  }

  Future<void> updateMuscleMap(int id, String name) async {
    await (update(muscleMaps)
          ..where(
            (tbl) => tbl.id.equals(id),
          ))
        .write(
      MuscleMapsCompanion(
        name: Value(name),
      ),
    );
  }
}
