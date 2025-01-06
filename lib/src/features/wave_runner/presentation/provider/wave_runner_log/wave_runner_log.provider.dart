import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/logs/presentation/dto/logs.dto.dart';
import 'package:fit_chrono/src/features/wave_runner/data/repository/wave_runner_impl.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'wave_runner_log.provider.g.dart';

@riverpod
class WaveRunnerLog extends _$WaveRunnerLog {
  @override
  DataState<String>? build() => null;

  void go(WaveRunnerLogDto log) async {
    state = DataLoading();

    final waveRunnerRepository = ref.read(waveRunnerImplProvider);

    final result = await waveRunnerRepository.log(log.toEntity());

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>(
        "🎉 Your workout wave has been logged! Every rep, every move, every effort - it's all tracked. Keep crushing it!",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
