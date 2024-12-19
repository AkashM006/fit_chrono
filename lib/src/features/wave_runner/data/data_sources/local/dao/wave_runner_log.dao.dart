import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/local/schema/wave_runner_log.schema.dart';

part 'wave_runner_log.dao.g.dart';

@DriftAccessor(tables: [WaveRunnerLogs])
class WaveRunnerLogDao extends DatabaseAccessor<AppDatabase>
    with _$WaveRunnerLogDaoMixin {
  final AppDatabase db;

  WaveRunnerLogDao(this.db) : super(db);

  Future<void> log(String message) async {
    // into(waveRunnerLogs).insert(WaveRunnerLogsCompanion(
    //   logMessage: Value(message),
    //   timestamp: Value(DateTime.now()),
    // ));
  }
}
