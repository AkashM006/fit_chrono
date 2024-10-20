import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

part 'muscle_map.dao.g.dart';

@DriftAccessor(tables: [MuscleMaps])
class MuscleMapDao extends DatabaseAccessor<AppDatabase>
    with _$MuscleMapDaoMixin {
  MuscleMapDao(super.key);

  Stream<List<MuscleMap>> watchMuscleMaps() {
    return select(muscleMaps).watch();
  }

  Future<void> addMuscleMap(String name) async {
    await into(muscleMaps).insert(
      MuscleMapsCompanion(
        name: Value(name),
      ),
    );
  }
}
