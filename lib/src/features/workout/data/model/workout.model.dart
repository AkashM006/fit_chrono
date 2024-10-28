import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutModel {
  int _id;
  String _name;
  List<MuscleMapModel> _muscles;
  WorkoutMeasureModel _measure;
  int _count;

  WorkoutModel({
    required int id,
    required String name,
    required List<MuscleMapModel> muscles,
    required WorkoutMeasureModel measure,
    required int count,
  })  : _id = id,
        _name = name,
        _muscles = muscles,
        _measure = measure,
        _count = count;

  int get id => _id;
  String get name => _name;
  List<MuscleMapModel> get muscles => _muscles;
  WorkoutMeasureModel get measure => _measure;
  int get count => _count;

  factory WorkoutModel.fromEntity(WorkoutEntity workout) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      muscles: workout.muscles
          .map((muscle) => MuscleMapModel.fromEntity(muscle))
          .toList(),
      measure: WorkoutMeasureModelMapper.fromEntity(workout.measure),
      count: workout.count,
    );
  }
}

enum WorkoutMeasureModel {
  time,
  reps,
}

class WorkoutMeasureModelMapper {
  static WorkoutMeasureModel fromEntity(WorkoutMeasureEntity measure) {
    switch (measure) {
      case WorkoutMeasureEntity.time:
        return WorkoutMeasureModel.time;
      case WorkoutMeasureEntity.reps:
        return WorkoutMeasureModel.reps;
    }
  }

  static WorkoutMeasureEntity toEntity(WorkoutMeasureModel measure) {
    switch (measure) {
      case WorkoutMeasureModel.reps:
        return WorkoutMeasureEntity.reps;
      case WorkoutMeasureModel.time:
        return WorkoutMeasureEntity.time;
    }
  }
}
