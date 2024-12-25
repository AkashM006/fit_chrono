import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';

class WaveRunnerLogDto {
  final int _id;
  final WorkoutWaveWithWorkoutsMeasureDto _workoutWaveWithWorkoutsMeasure;

  int get id => _id;
  WorkoutWaveWithWorkoutsMeasureDto get workoutWaveWithWorkoutsMeasure =>
      _workoutWaveWithWorkoutsMeasure;

  WaveRunnerLogDto({
    int id = -1,
    required WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkoutsMeasure,
  })  : _id = id,
        _workoutWaveWithWorkoutsMeasure = workoutWaveWithWorkoutsMeasure;

  WaveRunnerLogDto copyWith({
    int? id,
    WorkoutWaveWithWorkoutsMeasureDto? workoutWaveWithWorkoutsMeasure,
  }) {
    return WaveRunnerLogDto(
      id: id ?? this.id,
      workoutWaveWithWorkoutsMeasure:
          workoutWaveWithWorkoutsMeasure ?? this.workoutWaveWithWorkoutsMeasure,
    );
  }

  factory WaveRunnerLogDto.init() {
    return WaveRunnerLogDto(
      workoutWaveWithWorkoutsMeasure: WorkoutWaveWithWorkoutsMeasureDto.init(),
    );
  }

  factory WaveRunnerLogDto.fromEntity(WaveRunnerLogEntity entity) {
    return WaveRunnerLogDto(
      id: entity.id,
      workoutWaveWithWorkoutsMeasure:
          WorkoutWaveWithWorkoutsMeasureDto.fromEntity(
        entity.workoutWaveWithWorkoutsMeasure,
      ),
    );
  }

  WaveRunnerLogEntity toEntity() {
    return WaveRunnerLogEntity(
      id: id,
      workoutWaveWithWorkoutsMeasure: workoutWaveWithWorkoutsMeasure.toEntity(),
    );
  }

  @override
  bool operator ==(covariant WaveRunnerLogDto other) {
    return id == other.id &&
        workoutWaveWithWorkoutsMeasure == other.workoutWaveWithWorkoutsMeasure;
  }

  @override
  int get hashCode => id.hashCode ^ workoutWaveWithWorkoutsMeasure.hashCode;
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
  }) {
    return WorkoutWithWorkoutMeasureLogDto(
      workoutWithMeasure: workoutWithMeasure ?? this.workoutWithMeasure,
      elapsedTime: elapsedTime ?? this.elapsedTime,
      wasSkipped: wasSkipped ?? this.wasSkipped,
    );
  }

  factory WorkoutWithWorkoutMeasureLogDto.init() {
    return WorkoutWithWorkoutMeasureLogDto(
      workoutWithMeasure: WorkoutWithMeasureDto.init(),
      elapsedTime: 0,
      wasSkipped: false,
    );
  }

  factory WorkoutWithWorkoutMeasureLogDto.fromEntity(
    WorkoutWithWorkoutMeasureLogEntity entity,
  ) {
    return WorkoutWithWorkoutMeasureLogDto(
      workoutWithMeasure:
          WorkoutWithMeasureDto.fromEntity(entity.workoutWithMeasure),
      elapsedTime: entity.elapsedTime,
      wasSkipped: entity.wasSkipped,
    );
  }

  WorkoutWithWorkoutMeasureLogEntity toEntity() {
    return WorkoutWithWorkoutMeasureLogEntity(
      workoutWithMeasure: workoutWithMeasure.toEntity(),
      elapsedTime: elapsedTime,
      wasSkipped: wasSkipped,
    );
  }

  @override
  bool operator ==(covariant WorkoutWithWorkoutMeasureLogDto other) {
    return workoutWithMeasure == other.workoutWithMeasure &&
        elapsedTime == other.elapsedTime &&
        wasSkipped == other.wasSkipped;
  }

  @override
  int get hashCode =>
      workoutWithMeasure.hashCode ^ elapsedTime.hashCode ^ wasSkipped.hashCode;
}
