import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/add_muscle_map.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'add_muscle_map.provider.g.dart';

@riverpod
class AddMuscleMap extends _$AddMuscleMap {
  @override
  DataState<String>? build() => null;

  void go(MuscleMapDto newMuscleMap) async {
    state = DataLoading();

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result = await AddMuscleMapUsecase(muscleMapRepository)(
      params: newMuscleMap.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>(
        "New muscle map locked in—let's make every workout count! 💪",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
