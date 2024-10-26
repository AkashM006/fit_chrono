import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/add_muscle_map.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_muscle_map.provider.g.dart';

@riverpod
class AddMuscleMap extends _$AddMuscleMap {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(String name) async {
    state = DataLoading();

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result = await AddMuscleMapUsecase(muscleMapRepository)(params: name);

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>("Added your muscle map"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
