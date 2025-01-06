import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';

abstract class WaveRunnerRepository {
  Future<DataState<void>> log(WaveRunnerLogEntity log);
}
