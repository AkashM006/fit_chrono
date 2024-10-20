import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_muscle_map.provider.g.dart';

@riverpod
class AddMuscleMap extends _$AddMuscleMap {
  @override
  DataState<void>? build() {
    return null;
  }

  void go(String name) async {
    state = const DataLoading();

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result = await muscleMapRepository.addMuscleMap(name);

    state = result.fold(
      (data) => const DataSuccess<String>(data: 'Added to your muscle maps'),
      (error) => DataFailure(error: error),
    );
  }
}
