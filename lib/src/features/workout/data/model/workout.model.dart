import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutModel {
  int _id;
  String _name;
  List<MuscleMapModel> _muscles;

  WorkoutModel({
    required int id,
    required String name,
    required List<MuscleMapModel> muscles,
  })  : _id = id,
        _name = name,
        _muscles = muscles;

  int get id => _id;
  String get name => _name;
  List<MuscleMapModel> get muscles => _muscles;

  factory WorkoutModel.fromEntity(WorkoutEntity workout) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      muscles: workout.muscles
          .map((muscle) => MuscleMapModel.fromEntity(muscle))
          .toList(),
    );
  }

  factory WorkoutModel.fromDbModel(Workout workout) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      muscles: [],
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: id,
      name: name,
      muscles: muscles.map((muscle) => muscle.toEntity()).toList(),
    );
  }

  WorkoutsCompanion toCompanion() {
    return WorkoutsCompanion(
      name: Value(name),
    );
  }

  void setMuscles(List<MuscleMapModel> muscles) {
    _muscles = muscles;
  }
}

class WorkoutWithMeasureModel {
  final int _id;
  final WorkoutModel _workout;
  final WorkoutMeasureModel _measure;
  final int _count;

  const WorkoutWithMeasureModel({
    required int id,
    required WorkoutModel workout,
    required WorkoutMeasureModel measure,
    required int count,
  })  : _id = id,
        _workout = workout,
        _measure = measure,
        _count = count;

  int get id => _id;
  WorkoutModel get workout => _workout;
  WorkoutMeasureModel get measure => _measure;
  int get count => _count;

  factory WorkoutWithMeasureModel.fromEntity(
    WorkoutWithMeasureEntity workoutWithMeasure,
  ) {
    return WorkoutWithMeasureModel(
      id: workoutWithMeasure.id,
      workout: WorkoutModel.fromEntity(workoutWithMeasure.workoutEntity),
      measure: WorkoutMeasureModelMapper.fromEntity(workoutWithMeasure.measure),
      count: workoutWithMeasure.count,
    );
  }

  factory WorkoutWithMeasureModel.fromDbModel(
    WorkoutsWithMeasure workoutWithMeasure,
    Workout workout,
  ) {
    return WorkoutWithMeasureModel(
      id: workoutWithMeasure.id,
      workout: WorkoutModel.fromDbModel(workout),
      measure: WorkoutMeasureModelMapper.fromString(
          workoutWithMeasure.repititionType),
      count: workoutWithMeasure.repitition,
    );
  }

  WorkoutWithMeasureEntity toEntity() {
    return WorkoutWithMeasureEntity(
      id: id,
      workoutEntity: workout.toEntity(),
      measure: WorkoutMeasureModelMapper.toEntity(measure),
      count: count,
    );
  }

  WorkoutsWithMeasuresCompanion toCompanion() {
    return WorkoutsWithMeasuresCompanion(
      workoutId: Value(workout.id),
      repitition: Value(count),
      repititionType: Value(measure.toString()),
    );
  }
}

enum WorkoutMeasureModel {
  time,
  reps,
}

Map<String, WorkoutMeasureModel> stringMappedtoMeasure = {
  "time": WorkoutMeasureModel.time,
  "reps": WorkoutMeasureModel.reps,
};

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

  static WorkoutMeasureModel fromString(String text) {
    final result = stringMappedtoMeasure[text];

    return result ?? WorkoutMeasureModel.reps;
  }
}
