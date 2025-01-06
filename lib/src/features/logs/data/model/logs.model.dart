import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';
import 'package:fit_chrono/src/features/workout/data/model/workout.model.dart';
import 'package:fit_chrono/src/features/workout_wave/data/model/workout_wave.model.dart';

class WaveRunnerLogModel {
  final int _id;
  final WorkoutWaveWithWorkoutsMeasureModel _workoutWaveWithWorkoutsMeasure;
  final List<WorkoutWithWorkoutMeasureLogModel> _workoutWithWorkoutMeasureLogs;
  final int _totalTimeElapsed;
  final DateTime _createdAt;

  const WaveRunnerLogModel({
    required int id,
    required WorkoutWaveWithWorkoutsMeasureModel workoutWaveWithWorkoutsMeasure,
    required List<WorkoutWithWorkoutMeasureLogModel>
        workoutWithWorkoutMeasureLogs,
    required int totalTimeElapsed,
    required DateTime createdAt,
  })  : _id = id,
        _workoutWaveWithWorkoutsMeasure = workoutWaveWithWorkoutsMeasure,
        _workoutWithWorkoutMeasureLogs = workoutWithWorkoutMeasureLogs,
        _totalTimeElapsed = totalTimeElapsed,
        _createdAt = createdAt;

  int get id => _id;
  WorkoutWaveWithWorkoutsMeasureModel get workoutWaveWithWorkoutsMeasure =>
      _workoutWaveWithWorkoutsMeasure;
  List<WorkoutWithWorkoutMeasureLogModel> get workoutWithWorkoutMeasureLogs =>
      _workoutWithWorkoutMeasureLogs;
  int get totalTimeElapsed => _totalTimeElapsed;
  DateTime get createdAt => _createdAt;

  factory WaveRunnerLogModel.fromEntity(WaveRunnerLogEntity waveRunnerLog) =>
      WaveRunnerLogModel(
        id: waveRunnerLog.id,
        workoutWaveWithWorkoutsMeasure:
            WorkoutWaveWithWorkoutsMeasureModel.fromEntity(
          waveRunnerLog.workoutWaveWithWorkoutsMeasure,
        ),
        workoutWithWorkoutMeasureLogs: waveRunnerLog
            .workoutWithWorkoutMeasureLogs
            .map((e) => WorkoutWithWorkoutMeasureLogModel.fromEntity(e))
            .toList(),
        totalTimeElapsed: waveRunnerLog.totalTimeElapsed,
        createdAt: waveRunnerLog.createdAt,
      );

  factory WaveRunnerLogModel.fromDbModel(WaveRunnerLog waveRunnerLog) {
    final log = jsonDecode(waveRunnerLog.log);

    final resultLog = WaveRunnerLogModel.fromJson(log).copyWith(id: log.id);
    return resultLog;
  }

  WaveRunnerLogsCompanion toDbModel() => WaveRunnerLogsCompanion(
        log: Value(jsonEncode(toJson())),
      );

  WaveRunnerLogEntity toEntity() => WaveRunnerLogEntity(
        id: id,
        workoutWaveWithWorkoutsMeasure:
            workoutWaveWithWorkoutsMeasure.toEntity(),
        workoutWithWorkoutMeasureLogs:
            workoutWithWorkoutMeasureLogs.map((e) => e.toEntity()).toList(),
        totalTimeElapsed: totalTimeElapsed,
        createdAt: createdAt,
      );

  WaveRunnerLogsCompanion toCompanion() => WaveRunnerLogsCompanion(
        log: Value(jsonEncode(workoutWaveWithWorkoutsMeasure.toJson())),
      );

  @override
  bool operator ==(covariant WaveRunnerLogModel other) =>
      workoutWaveWithWorkoutsMeasure == other.workoutWaveWithWorkoutsMeasure;

  @override
  int get hashCode => Object.hash(
        id,
        workoutWaveWithWorkoutsMeasure,
        totalTimeElapsed,
        Object.hashAll(workoutWithWorkoutMeasureLogs),
        createdAt,
      );

  factory WaveRunnerLogModel.fromJson(Map<String, dynamic> json) =>
      WaveRunnerLogModel(
        id: json['id'] as int,
        workoutWaveWithWorkoutsMeasure:
            WorkoutWaveWithWorkoutsMeasureModel.fromJson(
          json['workoutWaveWithWorkoutsMeasure'] as Map<String, dynamic>,
        ),
        workoutWithWorkoutMeasureLogs:
            (json['workoutWithWorkoutMeasureLogs'] as List<dynamic>)
                .map(
                  (e) => WorkoutWithWorkoutMeasureLogModel.fromJson(
                    e as Map<String, dynamic>,
                  ),
                )
                .toList(),
        totalTimeElapsed: json['totalTimeElapsed'] as int,
        createdAt: DateTime.parse(json['createdAt'] as String),
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'workoutWaveWithWorkoutsMeasure':
            workoutWaveWithWorkoutsMeasure.toJson(),
        'workoutWithWorkoutMeasureLogs':
            workoutWithWorkoutMeasureLogs.map((e) => e.toJson()).toList(),
        'totalTimeElapsed': totalTimeElapsed,
        'createdAt': createdAt.toIso8601String(),
      };

  WaveRunnerLogModel copyWith({
    int? id,
    WorkoutWaveWithWorkoutsMeasureModel? workoutWaveWithWorkoutsMeasure,
    List<WorkoutWithWorkoutMeasureLogModel>? workoutWithWorkoutMeasureLogs,
    int? totalTimeElapsed,
    DateTime? createdAt,
  }) =>
      WaveRunnerLogModel(
        id: id ?? this.id,
        workoutWaveWithWorkoutsMeasure: workoutWaveWithWorkoutsMeasure ??
            this.workoutWaveWithWorkoutsMeasure,
        workoutWithWorkoutMeasureLogs:
            workoutWithWorkoutMeasureLogs ?? this.workoutWithWorkoutMeasureLogs,
        totalTimeElapsed: totalTimeElapsed ?? this.totalTimeElapsed,
        createdAt: createdAt ?? this.createdAt,
      );
}

class WorkoutWithWorkoutMeasureLogModel {
  final WorkoutWithMeasureModel _workoutWithMeasure;
  final int _elapsedTime;
  final bool _wasSkipped;

  const WorkoutWithWorkoutMeasureLogModel({
    required WorkoutWithMeasureModel workoutWithMeasure,
    required int elapsedTime,
    required bool wasSkipped,
  })  : _workoutWithMeasure = workoutWithMeasure,
        _elapsedTime = elapsedTime,
        _wasSkipped = wasSkipped;

  WorkoutWithMeasureModel get workoutWithMeasure => _workoutWithMeasure;
  int get elapsedTime => _elapsedTime;
  bool get wasSkipped => _wasSkipped;

  factory WorkoutWithWorkoutMeasureLogModel.fromEntity(
    WorkoutWithWorkoutMeasureLogEntity entity,
  ) =>
      WorkoutWithWorkoutMeasureLogModel(
        workoutWithMeasure:
            WorkoutWithMeasureModel.fromEntity(entity.workoutWithMeasure),
        elapsedTime: entity.elapsedTime,
        wasSkipped: entity.wasSkipped,
      );

  factory WorkoutWithWorkoutMeasureLogModel.fromJson(
    Map<String, dynamic> json,
  ) =>
      WorkoutWithWorkoutMeasureLogModel(
        workoutWithMeasure:
            WorkoutWithMeasureModel.fromJson(json['workoutWithMeasure']),
        elapsedTime: json['elapsedTime'] as int,
        wasSkipped: json['wasSkipped'] as bool,
      );

  WorkoutWithWorkoutMeasureLogEntity toEntity() =>
      WorkoutWithWorkoutMeasureLogEntity(
        workoutWithMeasure: workoutWithMeasure.toEntity(),
        elapsedTime: elapsedTime,
        wasSkipped: wasSkipped,
      );

  Map<String, dynamic> toJson() => {
        'workoutWithMeasure': workoutWithMeasure.toJson(),
        'elapsedTime': elapsedTime,
        'wasSkipped': wasSkipped,
      };

  WorkoutWithWorkoutMeasureLogModel copyWith({
    WorkoutWithMeasureModel? workoutWithMeasure,
    int? elapsedTime,
    bool? wasSkipped,
  }) =>
      WorkoutWithWorkoutMeasureLogModel(
        workoutWithMeasure: workoutWithMeasure ?? this.workoutWithMeasure,
        elapsedTime: elapsedTime ?? this.elapsedTime,
        wasSkipped: wasSkipped ?? this.wasSkipped,
      );

  @override
  bool operator ==(covariant WorkoutWithWorkoutMeasureLogModel other) =>
      workoutWithMeasure == other.workoutWithMeasure &&
      elapsedTime == other.elapsedTime &&
      wasSkipped == other.wasSkipped;

  @override
  int get hashCode => Object.hash(
        workoutWithMeasure,
        elapsedTime,
        wasSkipped,
      );
}
