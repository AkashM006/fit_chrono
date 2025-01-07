import 'package:fit_chrono/src/features/logs/data/repository/logs_impl.repository.dart';
import 'package:fit_chrono/src/features/logs/domain/usecase/watch_logs.usecase.dart';
import 'package:fit_chrono/src/features/logs/presentation/dto/logs.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'logs.provider.g.dart';

@riverpod
Stream<List<WaveRunnerLogDto>> logs(Ref ref) {
  final logsRepository = ref.watch(logsImplProvider);

  final result = WatchLogsUsecase(logsRepository)();

  final parsedResult = result.map(
    (logs) {
      return logs
          .map(
            (log) => WaveRunnerLogDto.fromEntity(log),
          )
          .toList();
    },
  );

  return parsedResult;
}
