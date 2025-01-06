import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/logs/domain/repository/logs.repository.dart';

class WatchLogsUsecase
    extends Usecase<Stream<List<WaveRunnerLogEntity>>, void> {
  final LogsRepository _logsRepository;

  const WatchLogsUsecase(this._logsRepository);

  @override
  Stream<List<WaveRunnerLogEntity>> call({void params}) =>
      _logsRepository.watchLogs();
}
