import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
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

  Future<void> addMuscleMap(MuscleMapsCompanion muscleMap) async {
    try {
      await into(muscleMaps).insert(muscleMap);
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("add your muscle map");
      throw AppError(message: errorMsg);
    }
  }

  Future<MuscleMap> getMuscleMap(int id) async {
    try {
      final query = (select(muscleMaps)
        ..where(
          (tbl) => tbl.id.equals(id),
        ));

      final result = await query.getSingleOrNull();

      if (result == null) {
        final errorMsg = doesNotExistMsg("muscle map you're trying to get");
        throw AppError(
          message: errorMsg,
        );
      }

      return result;
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("get your muscle map");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> updateMuscleMap(int id, MuscleMapsCompanion muscleMap) async {
    try {
      final query = (select(muscleMaps)
        ..where(
          (tbl) => tbl.id.equals(id),
        ));

      final result = await query.getSingleOrNull();

      if (result == null) {
        final errorMsg = doesNotExistMsg("muscle map you're trying update");
        throw AppError(
          message: errorMsg,
        );
      }

      await (update(muscleMaps)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .write(
        muscleMap,
      );
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("updating your muscle map");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> deleteMuscleMap(int id) async {
    try {
      final query = (select(muscleMaps)
        ..where(
          (tbl) => tbl.id.equals(id),
        ));

      final result = await query.getSingleOrNull();

      if (result == null) {
        final errorMsg = doesNotExistMsg("muscle map you're trying to delete");
        throw AppError(
          message: errorMsg,
        );
      }

      final rowsAffected = await (delete(muscleMaps)
            ..where(
              (tbl) => tbl.id.equals(id),
            ))
          .go();

      if (rowsAffected == 0) {
        final errorMsg = doesNotExistMsg("muscle map you're trying to delete");
        throw AppError(
          message: errorMsg,
        );
      }
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("deleting your muscle map");
      throw AppError(message: errorMsg);
    }
  }
}
