import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_map/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

part 'muscle_maps.dao.g.dart';

@DriftAccessor(tables: [MuscleMaps])
class MuscleMapsDao extends DatabaseAccessor<AppDatabase>
    with _$MuscleMapsDaoMixin {
  MuscleMapsDao(super.key);

  Stream<List<MuscleMap>> watchMuscleMaps() {
    return select(muscleMaps).watch();
  }

  // Future<void> createMuscleMap() {
  // }
}
