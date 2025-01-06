import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logs.service.g.dart';

class LogsService {
  final AppDatabase _appDatabase;

  const LogsService(this._appDatabase);

  Stream<List<WaveRunnerLogEntity>> watchLogs() =>
      _appDatabase.logDao.watchLogs().map(
            (logs) => logs
                .map(
                  (log) => log.toEntity(),
                )
                .toList(),
          );
}

@riverpod
LogsService logsService(Ref ref) {
  final db = ref.watch(dbProvider);

  return LogsService(db);
}
