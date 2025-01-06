import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/edit_muscle_map.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'edit_muscle_map.provider.g.dart';

@riverpod
class EditMuscleMap extends _$EditMuscleMap {
  @override
  DataState<String>? build() => null;

  void go(MuscleMapDto newMuscleMap) async {
    state = DataLoading();

    final muscleMapRepository = ref.read(muscleMapImplProvider);

    final result = await EditMuscleMapUsecase(muscleMapRepository)(
      params: newMuscleMap.toEntity(),
    );

    state = result.fold(
      onSuccess: (data) => DataSuccess<String>(
        "All set! Your muscle map is now up to date ✅",
      ),
      onFailure: (error) => DataFailure(error),
    );
  }
}
