import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

abstract class MuscleMapRepository {
  Stream<List<MuscleMapEntity>> watchMuscleMaps();
}
