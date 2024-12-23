import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/data/repository/base.repository.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/service/wave_runner.service.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/repository/wave_runner.repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wave_runner_impl.repository.g.dart';

class WaveRunnerImpl extends BaseRepository implements WaveRunnerRepository {
  final WaveRunnerService _waveRunnerService;

  const WaveRunnerImpl(this._waveRunnerService);

  @override
  Future<DataState<void>> log(WaveRunnerLogEntity log) => safeExecute(
        () => _waveRunnerService.log(log),
      );

  // @override
  // Stream<List<WaveRunnerEntity>> watchWaveRunners() {
  //   return _waveRunnerService.watchWaveRunners();
  // }

  // @override
  // Future<DataState<void>> addWaveRunner(WaveRunnerEntity waveRunner) {
  //   return safeExecute(
  //     () => _waveRunnerService.addWaveRunner(waveRunner),
  //   );
  // }

  // @override
  // Future<DataState<WaveRunnerEntity>> getWaveRunner(int id) {
  //   return safeExecute(() => _waveRunnerService.getWaveRunner(id));
  // }

  // @override
  // Future<DataState<void>> editWaveRunner(WaveRunnerEntity newWaveRunner) {
  //   return safeExecute(
  //     () => _waveRunnerService.editWaveRunner(
  //       newWaveRunner,
  //     ),
  //   );
  // }

  // @override
  // Future<DataState<void>> deleteWaveRunner(int id) {
  //   return safeExecute(
  //     () => _waveRunnerService.deleteWaveRunner(id),
  //   );
  // }
}

@riverpod
WaveRunnerImpl waveRunnerImpl(Ref ref) {
  final waveRunnerService = ref.watch(waveRunnerServiceProvider);

  return WaveRunnerImpl(waveRunnerService);
}
