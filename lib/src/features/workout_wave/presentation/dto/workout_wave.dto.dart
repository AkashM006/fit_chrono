import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/domain/entity/workout_wave.entity.dart';

class WorkoutWaveDto {
  final int _id;
  final String _name;
  final int _times;

  const WorkoutWaveDto({
    int id = -1,
    required String name,
    int times = 0,
  })  : _id = id,
        _name = name,
        _times = times;

  int get id => _id;
  String get name => _name;
  int get times => _times;

  factory WorkoutWaveDto.init() {
    return const WorkoutWaveDto(
      name: "",
    );
  }

  factory WorkoutWaveDto.fromEntity(WorkoutWaveEntity workoutWaveEntity) {
    return WorkoutWaveDto(
      id: workoutWaveEntity.id,
      name: workoutWaveEntity.name,
      times: workoutWaveEntity.times,
    );
  }

  WorkoutWaveEntity toEntity() {
    return WorkoutWaveEntity(
      id: id,
      name: name,
      times: times,
    );
  }

  WorkoutWaveDto copyWith({
    String? name,
    int? times,
  }) {
    return WorkoutWaveDto(
      id: id,
      name: name ?? this.name,
      times: times ?? this.times,
    );
  }

  @override
  bool operator ==(covariant WorkoutWaveDto other) {
    return other.id == _id && other.name == _name && other.times == _times;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode ^ times.hashCode;
}

class WorkoutWaveWithWorkoutsMeasureDto {
  final WorkoutWaveDto _workoutWave;
  final List<WorkoutWithMeasureDto> _workoutsWithMeasure;

  const WorkoutWaveWithWorkoutsMeasureDto({
    required WorkoutWaveDto workoutWave,
    required List<WorkoutWithMeasureDto> workoutsWithMeasure,
  })  : _workoutWave = workoutWave,
        _workoutsWithMeasure = workoutsWithMeasure;

  WorkoutWaveDto get workoutWave => _workoutWave;
  List<WorkoutWithMeasureDto> get workoutsWithMeasure => _workoutsWithMeasure;

  factory WorkoutWaveWithWorkoutsMeasureDto.fromEntity(
    WorkoutWaveWithWorkoutsMeasureEntity workoutWaveWithWorkoutMeasureEntity,
  ) {
    return WorkoutWaveWithWorkoutsMeasureDto(
      workoutWave: WorkoutWaveDto.fromEntity(
          workoutWaveWithWorkoutMeasureEntity.workoutWave),
      workoutsWithMeasure:
          workoutWaveWithWorkoutMeasureEntity.workoutsWithMeasure
              .map(
                (workoutWithMeasureEntity) =>
                    WorkoutWithMeasureDto.fromEntity(workoutWithMeasureEntity),
              )
              .toList(),
    );
  }

  WorkoutWaveWithWorkoutsMeasureEntity toEntity() {
    return WorkoutWaveWithWorkoutsMeasureEntity(
      workoutWave: workoutWave.toEntity(),
      workoutsWithMeasure: workoutsWithMeasure
          .map((workoutWithMeasure) => workoutWithMeasure.toEntity())
          .toList(),
    );
  }

  WorkoutWaveWithWorkoutsMeasureDto copyWith({
    WorkoutWaveDto? workoutWave,
    List<WorkoutWithMeasureDto>? workoutsWithMeasure,
  }) {
    return WorkoutWaveWithWorkoutsMeasureDto(
      workoutWave: workoutWave ?? this.workoutWave,
      workoutsWithMeasure: workoutsWithMeasure ?? this.workoutsWithMeasure,
    );
  }
}
