import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/modal/workout_wave.model.dart';

part 'workout_wave.dao.g.dart';

@DriftAccessor(tables: [WorkoutWaves])
class WorkoutWaveDao extends DatabaseAccessor<AppDatabase>
    with _$WorkoutWaveDaoMixin {
  WorkoutWaveDao(super.key);

  Stream<List<WorkoutWaveModel>> watchWorkoutWaves() {
    return select(workoutWaves).watch().map(
          (workoutWaves) => workoutWaves
              .map(
                (workoutWave) => WorkoutWaveModel.fromDbModel(workoutWave),
              )
              .toList(),
        );
  }
}
