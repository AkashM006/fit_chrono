import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/error_handler.util.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/local/schema/wave_runner.schema.dart';
import 'package:fit_chrono/src/features/wave_runner/data/model/wave_runner_log.model.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';

part 'wave_runner.dao.g.dart';

@DriftAccessor(tables: [
  WaveRunners,
  WorkoutWaves,
])
class WaveRunnerDao extends DatabaseAccessor<AppDatabase>
    with _$WaveRunnerDaoMixin {
  final AppDatabase db;

  WaveRunnerDao(this.db) : super(db);

  Future<void> log(WaveRunnerLogModel logModel) async {
    return handleError(
      () {
        return transaction(() async {
          final waveRunnerLog = WaveRunnersCompanion(
            log: Value(jsonEncode(logModel.toJson())),
          );

          await into(waveRunners).insert(waveRunnerLog);

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
}
