import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/delete_muscle_map.usecase.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'delete_muscle_map.provider.g.dart';

@riverpod
class DeleteMuscleMap extends _$DeleteMuscleMap {
  @override
  DataState<String>? build() {
    return null;
  }

  void go(int id) async {
    state = DataLoading();

    await Future.delayed(Duration(seconds: 3));

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result =
        await DeleteMuscleMapUsecase(muscleMapRepository)(params: id);

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>("Deleted your muscle map"),
      onFailure: (error) => DataFailure(error),
    );
  }
}
