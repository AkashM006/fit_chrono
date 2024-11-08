import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/model/muscle_map.model.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutModel {
  int _id;
  String _name;
  List<MuscleMapModel> _muscles;
  // WorkoutMeasureModel _measure;
  // int _count;

  WorkoutModel({
    required int id,
    required String name,
    required List<MuscleMapModel> muscles,
    // required WorkoutMeasureModel measure,
    // required int count,
  })  : _id = id,
        _name = name,
        _muscles = muscles;
  // _measure = measure,
  // _count = count;

  int get id => _id;
  String get name => _name;
  List<MuscleMapModel> get muscles => _muscles;
  // WorkoutMeasureModel get measure => _measure;
  // int get count => _count;

  factory WorkoutModel.fromEntity(WorkoutEntity workout) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      muscles: workout.muscles
          .map((muscle) => MuscleMapModel.fromEntity(muscle))
          .toList(),
      // measure: WorkoutMeasureModelMapper.fromEntity(workout.measure),
      // count: workout.count,
    );
  }

  factory WorkoutModel.fromDbModel(Workout workout) {
    return WorkoutModel(
      id: workout.id,
      name: workout.name,
      muscles: [],
      // measure: WorkoutMeasureModelMapper.fromString(workout.repititionType),
      // count: workout.repitition,
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: id,
      name: name,
      muscles: muscles.map((muscle) => muscle.toEntity()).toList(),
      // measure: WorkoutMeasureModelMapper.toEntity(measure),
      // count: count,
    );
  }

  WorkoutsCompanion toCompanion() {
    return WorkoutsCompanion(
      name: Value(name),
      // repitition: Value(count),
      // repititionType: Value(measure.toString()),
    );
  }

  void setMuscles(List<MuscleMapModel> muscles) {
    _muscles = muscles;
  }
}

// enum WorkoutMeasureModel {
//   time,
//   reps,
// }

// Map<String, WorkoutMeasureModel> stringMappedtoMeasure = {
//   "time": WorkoutMeasureModel.time,
//   "reps": WorkoutMeasureModel.reps,
// };

// class WorkoutMeasureModelMapper {
//   static WorkoutMeasureModel fromEntity(WorkoutMeasureEntity measure) {
//     switch (measure) {
//       case WorkoutMeasureEntity.time:
//         return WorkoutMeasureModel.time;
//       case WorkoutMeasureEntity.reps:
//         return WorkoutMeasureModel.reps;
//     }
//   }

//   static WorkoutMeasureEntity toEntity(WorkoutMeasureModel measure) {
//     switch (measure) {
//       case WorkoutMeasureModel.reps:
//         return WorkoutMeasureEntity.reps;
//       case WorkoutMeasureModel.time:
//         return WorkoutMeasureEntity.time;
//     }
//   }

//   static WorkoutMeasureModel fromString(String text) {
//     final result = stringMappedtoMeasure[text];

//     return result ?? WorkoutMeasureModel.reps;
//   }
// }
