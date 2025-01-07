import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_handler.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
import 'package:fit_chrono/src/features/logs/data/data_sources/local/schema/logs.schema.dart';
import 'package:fit_chrono/src/features/logs/data/model/logs.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';

part 'logs.dao.g.dart';

@DriftAccessor(tables: [
  WaveRunnerLogs,
  WorkoutWaves,
])
class LogDao extends DatabaseAccessor<AppDatabase> with _$LogDaoMixin {
  final AppDatabase db;

  LogDao(this.db) : super(db);

  Stream<List<WaveRunnerLogModel>> watchLogs() =>
      select(waveRunnerLogs).watch().map((logList) {
        return logList
            .map((log) => WaveRunnerLogModel.fromDbModel(log))
            .toList();
      }).handleError((error) {
        final errorMsg = somethingWentWrongMsg("getting your logs");
        throw AppError(message: errorMsg);
      });

  Future<void> log(WaveRunnerLogModel logModel) async => handleError(
        () {
          return transaction(() async {
            final waveRunnerLog = WaveRunnerLogsCompanion(
              log: Value(jsonEncode(logModel.toJson())),
            );

            await into(waveRunnerLogs).insert(waveRunnerLog);

            // increment the respective workout wave the count done
            final workoutWaveId =
                logModel.workoutWaveWithWorkoutsMeasure.workoutWave.id;

            final workoutWave =
                logModel.workoutWaveWithWorkoutsMeasure.workoutWave;

            await (update(workoutWaves)
                  ..where((tbl) => tbl.id.equals(workoutWaveId)))
                .write(
              WorkoutWavesCompanion(
                times: Value(workoutWave.times + 1),
              ),
            );
          });
        },
        "logging your workout session",
      );
}
