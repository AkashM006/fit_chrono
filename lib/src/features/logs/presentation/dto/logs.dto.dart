import 'package:collection/collection.dart';
import 'package:fit_chrono/src/features/logs/domain/entity/logs.entity.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';

class WaveRunnerLogDto {
  final int _id;
  final WorkoutWaveWithWorkoutsMeasureDto _workoutWaveWithWorkoutsMeasure;
  final List<WorkoutWithWorkoutMeasureLogDto> _workoutWithWorkoutMeasureLogs;
  final int _totalTimeElapsed;
  final DateTime _createdAt;

  int get id => _id;
  WorkoutWaveWithWorkoutsMeasureDto get workoutWaveWithWorkoutsMeasure =>
      _workoutWaveWithWorkoutsMeasure;
  List<WorkoutWithWorkoutMeasureLogDto> get workoutWithWorkoutMeasureLogs =>
      _workoutWithWorkoutMeasureLogs;
  int get totalTimeElapsed => _totalTimeElapsed;
  DateTime get createdAt => _createdAt;

  WaveRunnerLogDto({
    int id = -1,
    required WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkoutsMeasure,
    required List<WorkoutWithWorkoutMeasureLogDto>
        workoutWithWorkoutMeasureLogs,
    required int totalTimeElapsed,
    required DateTime createdAt,
  })  : _id = id,
        _workoutWaveWithWorkoutsMeasure = workoutWaveWithWorkoutsMeasure,
        _workoutWithWorkoutMeasureLogs = workoutWithWorkoutMeasureLogs,
        _totalTimeElapsed = totalTimeElapsed,
        _createdAt = createdAt;

  WaveRunnerLogDto copyWith({
    int? id,
    WorkoutWaveWithWorkoutsMeasureDto? workoutWaveWithWorkoutsMeasure,
    List<WorkoutWithWorkoutMeasureLogDto>? workoutWithWorkoutMeasureLogs,
    int? totalTimeElapsed,
    DateTime? createdAt,
  }) =>
      WaveRunnerLogDto(
        id: id ?? this.id,
        workoutWaveWithWorkoutsMeasure: workoutWaveWithWorkoutsMeasure ??
            this.workoutWaveWithWorkoutsMeasure,
        workoutWithWorkoutMeasureLogs:
            workoutWithWorkoutMeasureLogs ?? this.workoutWithWorkoutMeasureLogs,
        totalTimeElapsed: totalTimeElapsed ?? this.totalTimeElapsed,
        createdAt: createdAt ?? this.createdAt,
      );

  factory WaveRunnerLogDto.init(
    WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkoutsMeasure,
  ) =>
      WaveRunnerLogDto(
        workoutWaveWithWorkoutsMeasure: workoutWaveWithWorkoutsMeasure,
        workoutWithWorkoutMeasureLogs: [],
        totalTimeElapsed: 0,
        createdAt: DateTime.now(),
      );

  factory WaveRunnerLogDto.fromEntity(WaveRunnerLogEntity entity) =>
      WaveRunnerLogDto(
        id: entity.id,
        workoutWaveWithWorkoutsMeasure:
            WorkoutWaveWithWorkoutsMeasureDto.fromEntity(
          entity.workoutWaveWithWorkoutsMeasure,
        ),
        workoutWithWorkoutMeasureLogs: entity.workoutWithWorkoutMeasureLogs
            .map((e) => WorkoutWithWorkoutMeasureLogDto.fromEntity(e))
            .toList(),
        totalTimeElapsed: entity.totalTimeElapsed,
        createdAt: entity.createdAt,
      );

  WaveRunnerLogEntity toEntity() => WaveRunnerLogEntity(
        id: id,
        workoutWaveWithWorkoutsMeasure:
            workoutWaveWithWorkoutsMeasure.toEntity(),
        workoutWithWorkoutMeasureLogs:
            workoutWithWorkoutMeasureLogs.map((e) => e.toEntity()).toList(),
        totalTimeElapsed: totalTimeElapsed,
        createdAt: _createdAt,
      );

  @override
  bool operator ==(covariant WaveRunnerLogDto other) =>
      id == other.id &&
      workoutWaveWithWorkoutsMeasure == other.workoutWaveWithWorkoutsMeasure &&
      const ListEquality().equals(
        workoutWithWorkoutMeasureLogs,
        other.workoutWithWorkoutMeasureLogs,
      ) &&
      totalTimeElapsed == other.totalTimeElapsed;

  @override
  int get hashCode => Object.hash(
        id,
        workoutWaveWithWorkoutsMeasure,
        Object.hashAll(workoutWithWorkoutMeasureLogs),
        totalTimeElapsed,
      );
}

class WorkoutWithWorkoutMeasureLogDto {
  final WorkoutWithMeasureDto _workoutWithMeasure;
  final int _elapsedTime;
  final bool _wasSkipped;

  WorkoutWithMeasureDto get workoutWithMeasure => _workoutWithMeasure;
  int get elapsedTime => _elapsedTime;
  bool get wasSkipped => _wasSkipped;

  WorkoutWithWorkoutMeasureLogDto({
    required WorkoutWithMeasureDto workoutWithMeasure,
    int elapsedTime = 0,
    bool wasSkipped = false,
  })  : _workoutWithMeasure = workoutWithMeasure,
        _elapsedTime = elapsedTime,
        _wasSkipped = wasSkipped;

  WorkoutWithWorkoutMeasureLogDto copyWith({
    WorkoutWithMeasureDto? workoutWithMeasure,
    int? elapsedTime,
    bool? wasSkipped,
  }) =>
      WorkoutWithWorkoutMeasureLogDto(
        workoutWithMeasure: workoutWithMeasure ?? this.workoutWithMeasure,
        elapsedTime: elapsedTime ?? this.elapsedTime,
        wasSkipped: wasSkipped ?? this.wasSkipped,
      );

  factory WorkoutWithWorkoutMeasureLogDto.init() =>
      WorkoutWithWorkoutMeasureLogDto(
        workoutWithMeasure: WorkoutWithMeasureDto.init(),
        elapsedTime: 0,
        wasSkipped: false,
      );

  factory WorkoutWithWorkoutMeasureLogDto.fromEntity(
    WorkoutWithWorkoutMeasureLogEntity entity,
  ) =>
      WorkoutWithWorkoutMeasureLogDto(
        workoutWithMeasure:
            WorkoutWithMeasureDto.fromEntity(entity.workoutWithMeasure),
        elapsedTime: entity.elapsedTime,
        wasSkipped: entity.wasSkipped,
      );

  WorkoutWithWorkoutMeasureLogEntity toEntity() =>
      WorkoutWithWorkoutMeasureLogEntity(
        workoutWithMeasure: workoutWithMeasure.toEntity(),
        elapsedTime: elapsedTime,
        wasSkipped: wasSkipped,
      );

  @override
  bool operator ==(covariant WorkoutWithWorkoutMeasureLogDto other) =>
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
