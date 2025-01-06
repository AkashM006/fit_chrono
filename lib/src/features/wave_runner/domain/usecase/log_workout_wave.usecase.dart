import 'package:fit_chrono/src/core/usecase/usecase.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/repository/wave_runner.repository.dart';

class LogWorkoutWaveUsecase
    extends Usecase<Future<DataState<void>>, WaveRunnerLogEntity> {
  final WaveRunnerRepository _waveRunnerRepository;

  LogWorkoutWaveUsecase(this._waveRunnerRepository);

  @override
  Future<DataState<void>> call({required WaveRunnerLogEntity params}) =>
      _waveRunnerRepository.log(params);
}
