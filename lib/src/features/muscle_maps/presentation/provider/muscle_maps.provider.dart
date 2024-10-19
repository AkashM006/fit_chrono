import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/watch_muscle_maps.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'muscle_maps.provider.g.dart';

@riverpod
Stream<List<MuscleMapEntity>> muscleMaps(MuscleMapsRef ref) {
  final muscleMapRepository = ref.watch(muscleMapImplProvider);

  return WatchMuscleMapsUsecase(muscleMapRepository)();
}
