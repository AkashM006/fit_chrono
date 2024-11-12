import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_handler.util.dart';
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
    return select(muscleMaps)
        .watch()
        .map(
          (muscleMapList) => muscleMapList
              .map(
                (muscleMap) => MuscleMapModel.fromDbModel(muscleMap),
              )
              .toList(),
        )
        .handleError((error) {
      final errorMsg = somethingWentWrongMsg("getting you workouts");
      throw AppError(message: errorMsg);
    });
  }

  Future<void> addMuscleMap(MuscleMapModel muscleMap) async {
    handleError(
      () async {
        await into(muscleMaps).insert(muscleMap.toCompanion());
      },
      "addding your muscle map",
    );
  }

  Future<MuscleMapModel> getMuscleMap(int id) async {
    return handleError(
      () async {
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
      },
      "getting your muscle map",
    );
  }

  Future<void> updateMuscleMap(int id, MuscleMapModel muscleMap) async {
    handleError(
      () async {
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
            .write(muscleMap.toCompanion());
      },
      "updating your muscle map",
    );
  }

  Future<void> deleteMuscleMap(int id) async {
    handleError(
      () async {
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
          final errorMsg =
              doesNotExistMsg("muscle map you're trying to delete");
          throw AppError(
            message: errorMsg,
          );
        }

        await (delete(muscleMaps)
              ..where(
                (tbl) => tbl.id.equals(id),
              ))
            .go();
      },
      "deleting your muscle map",
    );
  }
}
