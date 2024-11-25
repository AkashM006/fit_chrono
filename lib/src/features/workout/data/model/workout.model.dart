import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';
import 'package:collection/collection.dart';

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

  @override
  bool operator ==(covariant WorkoutModel other) {
    if (name != other.name) return false;

    return const ListEquality().equals(muscles, other.muscles);
  }

  @override
  int get hashCode {
    int hashCode = name.hashCode;

    for (var muscle in muscles) {
      hashCode = hashCode ^ muscle.hashCode;
    }

    return hashCode;
  }
}

class WorkoutWithMeasureModel {
  final int _id;
  final WorkoutModel _workout;
  final WorkoutMeasureModel _measure;
  final int _count;
  final int _position;

  const WorkoutWithMeasureModel({
    required int id,
    required WorkoutModel workout,
    required WorkoutMeasureModel measure,
    required int count,
    int position = -1,
  })  : _id = id,
        _workout = workout,
        _measure = measure,
        _count = count,
        _position = position;

  int get id => _id;
  WorkoutModel get workout => _workout;
  WorkoutMeasureModel get measure => _measure;
  int get count => _count;
  int get position => _position;

  factory WorkoutWithMeasureModel.fromEntity(
    WorkoutWithMeasureEntity workoutWithMeasure,
  ) {
    return WorkoutWithMeasureModel(
      id: workoutWithMeasure.id,
      workout: WorkoutModel.fromEntity(workoutWithMeasure.workout),
      measure: WorkoutMeasureModelMapper.fromEntity(
        workoutWithMeasure.workoutMeasure,
      ),
      count: workoutWithMeasure.count,
      position: workoutWithMeasure.position,
    );
  }

  factory WorkoutWithMeasureModel.fromDbModel({
    required WorkoutsWithMeasure workoutWithMeasure,
    required Workout workout,
    int position = -1,
  }) {
    return WorkoutWithMeasureModel(
      id: workoutWithMeasure.id,
      workout: WorkoutModel.fromDbModel(workout),
      measure: WorkoutMeasureModelMapper.fromString(
        workoutWithMeasure.repititionType,
      ),
      count: workoutWithMeasure.repitition,
      position: position,
    );
  }

  WorkoutWithMeasureEntity toEntity() {
    return WorkoutWithMeasureEntity(
      id: id,
      workout: workout.toEntity(),
      workoutMeasure: WorkoutMeasureModelMapper.toEntity(measure),
      count: count,
      position: position,
    );
  }

  String toMapKey() {
    return "${workout.id}-$count-${measure.toString()}";
  }

  WorkoutsWithMeasuresCompanion toCompanion() {
    return WorkoutsWithMeasuresCompanion(
      workoutId: Value(workout.id),
      repitition: Value(count),
      repititionType: Value(measure.toString()),
    );
  }

  @override
  bool operator ==(covariant WorkoutWithMeasureModel other) {
    return workout == other.workout &&
        measure == other.measure &&
        count == other.count;
  }

  @override
  int get hashCode => workout.hashCode ^ measure.hashCode ^ count.hashCode;

  WorkoutWithMeasureModel copyWith({
    int? id,
    int? position,
  }) {
    return WorkoutWithMeasureModel(
      id: id ?? this.id,
      workout: workout,
      measure: measure,
      count: count,
      position: position ?? this.position,
    );
  }

  @override
  String toString() {
    return "WorkoutWithMeasureModel(id: $id, workoutName: ${workout.name}, measure: $measure, count: $count, position: $position)";
  }
}

enum WorkoutMeasureModel {
  time,
  reps,
}

Map<String, WorkoutMeasureModel> stringMappedtoMeasure = {
  "WorkoutMeasureModel.time": WorkoutMeasureModel.time,
  "WorkoutMeasureModel.reps": WorkoutMeasureModel.reps,
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
