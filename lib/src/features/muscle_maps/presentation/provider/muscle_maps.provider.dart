import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/watch_muscle_maps.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_maps.provider.g.dart';

@riverpod
Stream<List<MuscleMapDto>> muscleMaps(Ref ref) {
  final muscleMapRepository = ref.watch(muscleMapImplProvider);

  final result = WatchMuscleMapsUsecase(muscleMapRepository)();

  return result.map(
    (muscleMapList) => muscleMapList
        .map(
          (muscleMap) => MuscleMapDto.fromEntity(muscleMap),
        )
        .toList(),
  );
}
