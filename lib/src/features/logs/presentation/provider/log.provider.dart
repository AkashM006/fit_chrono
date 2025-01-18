import 'package:fit_chrono/src/features/logs/data/repository/logs_impl.repository.dart';
import 'package:fit_chrono/src/features/logs/domain/usecase/watch_log.usecase.dart';
import 'package:fit_chrono/src/features/logs/presentation/dto/logs.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'log.provider.g.dart';

@riverpod
Stream<WaveRunnerLogDto> log(Ref ref, int id) {
  final logsRepository = ref.watch(logsImplProvider);

  final result = WatchLogUsecase(logsRepository)(params: id);

  final parsedResult = result.map((log) => WaveRunnerLogDto.fromEntity(log));

  return parsedResult;
}
