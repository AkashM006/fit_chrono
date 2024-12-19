import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';
import 'package:fit_chrono/src/features/workout_wave/data/model/workout_wave.model.dart';

class WaveRunnerLogModel {
  final int _id;
  final WorkoutWaveWithWorkoutsMeasureModel _workoutWaveWithWorkoutsMeasure;

  const WaveRunnerLogModel({
    required int id,
    required WorkoutWaveWithWorkoutsMeasureModel workoutWaveWithWorkoutsMeasure,
  })  : _id = id,
        _workoutWaveWithWorkoutsMeasure = workoutWaveWithWorkoutsMeasure;

  int get id => _id;
  WorkoutWaveWithWorkoutsMeasureModel get workoutWaveWithWorkoutsMeasure =>
      _workoutWaveWithWorkoutsMeasure;

  factory WaveRunnerLogModel.fromEntity(WaveRunnerLogEntity waveRunnerLog) {
    return WaveRunnerLogModel(
      id: waveRunnerLog.id,
      workoutWaveWithWorkoutsMeasure:
          WorkoutWaveWithWorkoutsMeasureModel.fromEntity(
        waveRunnerLog.workoutWaveWithWorkoutsMeasure,
      ),
    );
  }

  factory WaveRunnerLogModel.fromDbModel(WaveRunnerLog waveRunnerLog) {
    return WaveRunnerLogModel(
      id: waveRunnerLog.id,
      workoutWaveWithWorkoutsMeasure:
          WorkoutWaveWithWorkoutsMeasureModel.fromJson(
        jsonDecode(waveRunnerLog.log),
      ),
    );
  }

  WaveRunnerLogEntity toEntity() {
    return WaveRunnerLogEntity(
      id: id,
      workoutWaveWithWorkoutsMeasure: workoutWaveWithWorkoutsMeasure.toEntity(),
    );
  }

  WaveRunnerLogsCompanion toCompanion() {
    return WaveRunnerLogsCompanion(
      log: Value(jsonEncode(workoutWaveWithWorkoutsMeasure.toJson())),
    );
  }

  @override
  bool operator ==(covariant WaveRunnerLogModel other) {
    return workoutWaveWithWorkoutsMeasure ==
        other.workoutWaveWithWorkoutsMeasure;
  }

  @override
  int get hashCode => workoutWaveWithWorkoutsMeasure.hashCode;

  factory WaveRunnerLogModel.fromJson(Map<String, dynamic> json) {
    return WaveRunnerLogModel(
      id: json['id'] as int,
      workoutWaveWithWorkoutsMeasure:
          WorkoutWaveWithWorkoutsMeasureModel.fromJson(
        json['workoutWaveWithWorkoutsMeasure'] as Map<String, dynamic>,
      ),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'workoutWaveWithWorkoutsMeasure': workoutWaveWithWorkoutsMeasure.toJson(),
    };
  }
}
