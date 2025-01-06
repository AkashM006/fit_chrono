import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';

abstract class LogsRepository {
  Stream<List<WaveRunnerLogEntity>> watchLogs();
}
