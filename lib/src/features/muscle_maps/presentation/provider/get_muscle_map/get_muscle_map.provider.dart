import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/repository/muscle_map_impl.repository.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/usecase/get_muscle_map.usecase.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'get_muscle_map.provider.g.dart';

@riverpod
Future<MuscleMapDto> muscleMap(MuscleMapRef ref, int id) async {
  final muscleMapRepository = ref.watch(muscleMapImplProvider);

  try {
    final result = await GetMuscleMapUsecase(muscleMapRepository)(params: id);
    return MuscleMapDto.fromEntity(result);
  } catch (e) {
    final errorMsg = somethingWentWrongMsg("fetching your muscle maps");
    throw AppError(message: errorMsg);
  }
}
