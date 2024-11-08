import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class WorkoutWaveModel {
  final int _id;
  final String _name;
  final int _times;

  WorkoutWaveModel({
    required int id,
    required String name,
    required int times,
  })  : _id = id,
        _name = name,
        _times = times;

  int get id => _id;
  String get name => _name;
  int get times => _times;

  factory WorkoutWaveModel.fromEntity(WorkoutWaveEntity entity) {
    return WorkoutWaveModel(
      id: entity.id,
      name: entity.name,
      times: entity.times,
    );
  }

  factory WorkoutWaveModel.fromDbModel(WorkoutWave workoutWave) {
    return WorkoutWaveModel(
      id: workoutWave.id,
      name: workoutWave.name,
      times: workoutWave.times,
    );
  }

  WorkoutWaveEntity toEntity() {
    return WorkoutWaveEntity(
      id: id,
      name: name,
      times: times,
    );
  }

  // todo: Implement toCompanion method
}
