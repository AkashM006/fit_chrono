import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/get_muscle_map.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_muscle_map.provider.g.dart';

@riverpod
Future<MuscleMapDto> muscleMap(Ref ref, int id) async {
  final muscleMapRepository = ref.watch(muscleMapImplProvider);

  final result = await GetMuscleMapUsecase(muscleMapRepository)(params: id);

  return result.fold(
    onSuccess: (data) => MuscleMapDto.fromEntity(data),
    onFailure: (error) => throw error,
  );
}
