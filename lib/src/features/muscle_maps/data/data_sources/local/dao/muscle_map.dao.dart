import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

part 'muscle_map.dao.g.dart';

@DriftAccessor(tables: [MuscleMaps])
class MuscleMapDao extends DatabaseAccessor<AppDatabase>
    with _$MuscleMapDaoMixin {
  MuscleMapDao(super.key);

  Stream<List<MuscleMapModel>> watchMuscleMaps() {
    try {
      return select(muscleMaps).watch().map(
            (muscleMapList) => muscleMapList
                .map(
                  (muscleMap) => MuscleMapModel.fromDbModel(muscleMap),
                )
                .toList(),
          );
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("getting you workouts");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> addMuscleMap(MuscleMapModel muscleMap) async {
    try {
      await into(muscleMaps).insert(MuscleMapsCompanion(
        name: Value(muscleMap.name),
      ));
    } catch (e) {
      final errorMsg = somethingWentWrongMsg("addding your muscle map");
      throw AppError(message: errorMsg);
    }
  }

  Future<MuscleMapModel> getMuscleMap(int id) async {
    try {
      final query = (select(muscleMaps)
        ..where(
          (tbl) => tbl.id.equals(id),
        ));

      final muscleMap = await query.getSingleOrNull();

      if (muscleMap == null) {
        final errorMsg = doesNotExistMsg("muscle map you're trying to get");
        throw AppError(
          message: errorMsg,
        );
      }

      return MuscleMapModel.fromDbModel(muscleMap);
    } catch (e) {
      if (e is AppError) rethrow;
      final errorMsg = somethingWentWrongMsg("getting your muscle map");
      throw AppError(message: errorMsg);
    }
  }

  Future<void> updateMuscleMap(int id, MuscleMapModel muscleMap) async {
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
        MuscleMapsCompanion(
          name: Value(muscleMap.name),
        ),
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

      final result = await query.get();

      if (result.length > 1) {
        final errorMsg = multipleRecordsFound("delete your muscle map");
        throw AppError(
          message: errorMsg,
        );
      }

      if (result.isEmpty) {
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
