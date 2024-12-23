import 'package:drift/drift.dart';
import 'package:fit_chrono/src/core/utils/error_handler.util.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/local/schema/wave_runner.schema.dart';

part 'wave_runner.dao.g.dart';

@DriftAccessor(tables: [WaveRunners])
class WaveRunnerDao extends DatabaseAccessor<AppDatabase>
    with _$WaveRunnerDaoMixin {
  final AppDatabase db;

  WaveRunnerDao(this.db) : super(db);

  Future<void> log(String message) async {
    return handleError(
      () => into(waveRunners).insert(
        WaveRunnersCompanion(
          log: Value(message),
        ),
      ),
      "logging your workout session",
    );
  }
}
