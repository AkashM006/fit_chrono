import 'package:fit_chrono/src/features/wave_runner/domain/entity/wave_runner_log.entity.dart';
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
