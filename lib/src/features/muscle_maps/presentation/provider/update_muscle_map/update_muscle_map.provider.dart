import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/update_muscle_map.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'update_muscle_map.provider.g.dart';

@riverpod
class UpdateMuscleMap extends _$UpdateMuscleMap {
  @override
  DataState<void>? build() {
    return null;
  }

  void go(MuscleMapDto newMuscleMap) async {
    state = const DataLoading();

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result = await UpdateMuscleMapUsecase(muscleMapRepository)(
      params: newMuscleMap.toEntity(),
    );

    state = result.fold(
      (data) => const DataSuccess<String>(data: 'Updated your muscle map'),
      (error) => DataFailure(error: error),
    );
  }
}
