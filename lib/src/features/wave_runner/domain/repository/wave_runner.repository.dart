import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';

abstract class WaveRunnerRepository {
  Future<DataState<void>> log(WaveRunnerLogEntity log);
}
