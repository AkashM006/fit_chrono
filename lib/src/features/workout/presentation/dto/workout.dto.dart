import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutDto {
  int _id;
  String _name;
  List<MuscleMapDto> _muscles;
  WorkoutMeasureDto _measure;
  int _count;

  WorkoutDto({
    int id = -1,
    required String name,
    required List<MuscleMapDto> muscles,
    required WorkoutMeasureDto measure,
    required int count,
  })  : _id = id,
        _name = name,
        _muscles = muscles,
        _measure = measure,
        _count = count;

  int get id => _id;
  String get name => _name;
  List<MuscleMapDto> get muscles => _muscles;
  WorkoutMeasureDto get measure => _measure;
  int get count => _count;

  factory WorkoutDto.init() {
    return WorkoutDto(
      name: "",
      muscles: [],
      measure: WorkoutMeasureDto.reps,
      count: 0,
    );
  }

  factory WorkoutDto.fromEntity(WorkoutEntity workout) {
    return WorkoutDto(
      id: workout.id,
      name: workout.name,
      muscles: workout.muscles
          .map((muscle) => MuscleMapDto.fromEntity(muscle))
          .toList(),
      measure: WorkoutMeasureModelMapper.fromEntity(workout.measure),
      count: workout.count,
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: id,
      name: name,
      muscles: muscles.map((muscle) => muscle.toEntity()).toList(),
      measure: WorkoutMeasureModelMapper.toEntity(measure),
      count: count,
    );
  }

  void addMuscle(MuscleMapDto muscle) {
    muscles.add(muscle);
  }

  WorkoutDto copyWith({
    String? name,
    List<MuscleMapDto>? muscles,
    WorkoutMeasureDto? measure,
    int? count,
  }) {
    return WorkoutDto(
      id: id,
      name: name ?? this.name,
      muscles: muscles ?? this.muscles,
      measure: measure ?? this.measure,
      count: count ?? this.count,
    );
  }
}

enum WorkoutMeasureDto {
  time,
  reps,
}

Map<String, WorkoutMeasureDto> stringMappedtoMeasure = {
  "time": WorkoutMeasureDto.time,
  "reps": WorkoutMeasureDto.reps,
};

class WorkoutMeasureModelMapper {
  static WorkoutMeasureDto fromEntity(WorkoutMeasureEntity measure) {
    switch (measure) {
      case WorkoutMeasureEntity.time:
        return WorkoutMeasureDto.time;
      case WorkoutMeasureEntity.reps:
        return WorkoutMeasureDto.reps;
    }
  }

  static WorkoutMeasureEntity toEntity(WorkoutMeasureDto measure) {
    switch (measure) {
      case WorkoutMeasureDto.reps:
        return WorkoutMeasureEntity.reps;
      case WorkoutMeasureDto.time:
        return WorkoutMeasureEntity.time;
    }
  }
}
