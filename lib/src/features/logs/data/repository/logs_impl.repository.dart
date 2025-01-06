import 'package:fit_chrono/src/features/logs/data/data_sources/service/logs.service.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/logs/domain/repository/logs.repository.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

class LogsImplRepository extends BaseRepository implements LogsRepository {
  final LogsService _logsService;

  const LogsImplRepository(this._logsService);

  @override
  Stream<List<WaveRunnerLogEntity>> watchLogs() => _logsService.watchLogs();
}

@riverpod
LogsImplRepository logsImplRepository(Ref ref) {
  final logsService = ref.watch(logsServiceProvider);

  return LogsImplRepository(logsService);
}
