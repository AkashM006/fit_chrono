import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';
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

  WorkoutWavesCompanion toCompanion() {
    return WorkoutWavesCompanion(
      name: Value(name),
      times: Value(times),
    );
  }

  factory WorkoutWaveModel.fromJson(Map<String, dynamic> json) {
    return WorkoutWaveModel(
      id: json['id'] as int,
      name: json['name'] as String,
      times: json['times'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'times': times,
    };
  }
}

class WorkoutWaveWithWorkoutsMeasureModel {
  final WorkoutWaveModel _workoutWave;
  final List<WorkoutWithMeasureModel> _workoutsWithMeasure;

  const WorkoutWaveWithWorkoutsMeasureModel({
    required WorkoutWaveModel workoutWave,
    required List<WorkoutWithMeasureModel> workoutsWithMeasure,
  })  : _workoutWave = workoutWave,
        _workoutsWithMeasure = workoutsWithMeasure;

  WorkoutWaveModel get workoutWave => _workoutWave;
  List<WorkoutWithMeasureModel> get workoutsWithMeasure => _workoutsWithMeasure;

  factory WorkoutWaveWithWorkoutsMeasureModel.fromEntity(
    WorkoutWaveWithWorkoutsMeasureEntity entity,
  ) {
    return WorkoutWaveWithWorkoutsMeasureModel(
      workoutWave: WorkoutWaveModel.fromEntity(entity.workoutWave),
      workoutsWithMeasure: entity.workoutsWithMeasure
          .map((workoutWithMeasurement) =>
              WorkoutWithMeasureModel.fromEntity(workoutWithMeasurement))
          .toList(),
    );
  }

  factory WorkoutWaveWithWorkoutsMeasureModel.fromDbModel({
    required WorkoutWave workoutWaveDetail,
    required List<WorkoutsInWave> positionDetails,
    required List<WorkoutsWithMeasure> workoutsWithMeasureDetails,
    required List<Workout> workoutDetails,
  }) {
    final workoutWaveModel = WorkoutWaveModel.fromDbModel(workoutWaveDetail);

    final workoutWithMeasureList =
        workoutDetails.asMap().entries.map((workoutWithMeasureEntry) {
      final index = workoutWithMeasureEntry.key;

      final workoutDetail = workoutDetails[index];
      final positionDetail = positionDetails[index];
      final workoutsWithMeasureDetail = workoutsWithMeasureDetails[index];

      return WorkoutWithMeasureModel.fromDbModel(
        workoutWithMeasure: workoutsWithMeasureDetail,
        workout: workoutDetail,
        position: positionDetail.position,
      );
    }).toList();

    return WorkoutWaveWithWorkoutsMeasureModel(
      workoutWave: workoutWaveModel,
      workoutsWithMeasure: workoutWithMeasureList,
    );
  }

  WorkoutWaveWithWorkoutsMeasureEntity toEntity() {
    return WorkoutWaveWithWorkoutsMeasureEntity(
      workoutsWithMeasure: workoutsWithMeasure
          .map((workoutWithMeasure) => workoutWithMeasure.toEntity())
          .toList(),
      workoutWave: workoutWave.toEntity(),
    );
  }

  factory WorkoutWaveWithWorkoutsMeasureModel.fromJson(
      Map<String, dynamic> json) {
    return WorkoutWaveWithWorkoutsMeasureModel(
      workoutWave: WorkoutWaveModel.fromJson(
          json['workoutWave'] as Map<String, dynamic>),
      workoutsWithMeasure: (json['workoutsWithMeasure'] as List)
          .map(
            (workout) => WorkoutWithMeasureModel.fromJson(
                workout as Map<String, dynamic>),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'workoutWave': workoutWave.toJson(),
      'workoutsWithMeasure':
          workoutsWithMeasure.map((workout) => workout.toJson()).toList(),
    };
  }
  // implement other methods if required
}
