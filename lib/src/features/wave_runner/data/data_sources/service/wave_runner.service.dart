import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/wave_runner/data/model/wave_runner_log.model.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wave_runner.service.g.dart';

class WaveRunnerService {
  final AppDatabase _db;

  const WaveRunnerService(this._db);

  Future<void> log(WaveRunnerLogEntity log) async {
    final logModel = WaveRunnerLogModel.fromEntity(log);

    return _db.waveRunnerDao.log(logModel);
  }
}

@riverpod
WaveRunnerService waveRunnerService(Ref ref) {
  final db = ref.watch(dbProvider);

  return WaveRunnerService(db);
}
