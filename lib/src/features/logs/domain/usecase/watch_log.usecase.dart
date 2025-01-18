import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/logs/domain/repository/logs.repository.dart';

class WatchLogUsecase extends Usecase<Stream<WaveRunnerLogEntity>, int> {
  final LogsRepository _logsRepository;

  const WatchLogUsecase(this._logsRepository);

  @override
  Stream<WaveRunnerLogEntity> call({required int params}) =>
      _logsRepository.watchLog(params);
}
