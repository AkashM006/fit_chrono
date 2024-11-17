import 'package:fit_chrono/src/core/utils/uuid.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/workout/domain/entity/workout.entity.dart';

class WorkoutDto {
  int _id;
  String _name;
  List<MuscleMapDto> _muscles;

  WorkoutDto({
    int id = -1,
    required String name,
    required List<MuscleMapDto> muscles,
  })  : _id = id,
        _name = name,
        _muscles = muscles;

  int get id => _id;
  String get name => _name;
  List<MuscleMapDto> get muscles => _muscles;

  factory WorkoutDto.init() {
    return WorkoutDto(
      name: "",
      muscles: [],
    );
  }

  factory WorkoutDto.fromEntity(WorkoutEntity workout) {
    return WorkoutDto(
      id: workout.id,
      name: workout.name,
      muscles: workout.muscles
          .map((muscle) => MuscleMapDto.fromEntity(muscle))
          .toList(),
    );
  }

  WorkoutEntity toEntity() {
    return WorkoutEntity(
      id: id,
      name: name,
      muscles: muscles.map((muscle) => muscle.toEntity()).toList(),
    );
  }

  void addMuscle(MuscleMapDto muscle) {
    muscles.add(muscle);
  }

  WorkoutDto copyWith({
    String? name,
    List<MuscleMapDto>? muscles,
  }) {
    return WorkoutDto(
      id: id,
      name: name ?? this.name,
      muscles: muscles ?? this.muscles,
    );
  }

  @override
  bool operator ==(covariant WorkoutDto other) {
    if (name != other.name) return false;
    if (muscles.length != other.muscles.length) return false;
    final length = muscles.length;

    for (var i = 0; i < length; i++) {
      if (muscles[i] != other.muscles[i]) return false;
    }
    return true;
  }

  @override
  int get hashCode {
    var hashCode = id.hashCode ^ name.hashCode;
    for (var muscle in muscles) {
      hashCode = hashCode ^ muscle.hashCode;
    }
    return hashCode;
  }
}

class WorkoutWithMeasureDto {
  final int _id;
  final String _uniqueId;
  final WorkoutDto _workout;
  final WorkoutMeasureDto _workoutMeasure;
  final int _count;
  final int _position;

  const WorkoutWithMeasureDto({
    int id = -1,
    String uniqueId = '',
    required WorkoutDto workout,
    required WorkoutMeasureDto workoutMeasure,
    required int count,
    required int position,
  })  : _id = id,
        _uniqueId = uniqueId,
        _workout = workout,
        _workoutMeasure = workoutMeasure,
        _count = count,
        _position = position;

  int get id => _id;
  String get uniqueId => _uniqueId;
  WorkoutDto get workout => _workout;
  WorkoutMeasureDto get workoutMeasure => _workoutMeasure;
  int get count => _count;
  int get position => _position;

  factory WorkoutWithMeasureDto.fromEntity(
    WorkoutWithMeasureEntity workoutWithMeasure,
  ) {
    return WorkoutWithMeasureDto(
      workout: WorkoutDto.fromEntity(workoutWithMeasure.workout),
      workoutMeasure: WorkoutMeasureDtoMapper.fromEntity(
        workoutWithMeasure.workoutMeasure,
      ),
      count: workoutWithMeasure.count,
      position: workoutWithMeasure.position,
    );
  }

  WorkoutWithMeasureEntity toEntity() {
    return WorkoutWithMeasureEntity(
      id: id,
      workout: workout.toEntity(),
      workoutMeasure: WorkoutMeasureDtoMapper.toEntity(workoutMeasure),
      count: count,
      position: position,
    );
  }

  factory WorkoutWithMeasureDto.init() {
    return WorkoutWithMeasureDto(
      uniqueId: uuid.v4(),
      workout: WorkoutDto.init(),
      workoutMeasure: WorkoutMeasureDto.time,
      count: 0,
      position: -1,
    );
  }

  WorkoutWithMeasureDto copyWith({
    WorkoutDto? workout,
    WorkoutMeasureDto? workoutMeasure,
    int? count,
    int? position,
  }) {
    return WorkoutWithMeasureDto(
      workout: workout ?? this.workout,
      workoutMeasure: workoutMeasure ?? this.workoutMeasure,
      count: count ?? this.count,
      position: position ?? this.position,
    );
  }

  @override
  bool operator ==(covariant WorkoutWithMeasureDto other) {
    return _workout == other.workout &&
        _workoutMeasure == other.workoutMeasure &&
        _count == other.count &&
        _position == other.position;
  }

  @override
  int get hashCode =>
      _workout.hashCode ^
      _workoutMeasure.hashCode ^
      _count.hashCode ^
      _position.hashCode;
}

enum WorkoutMeasureDto {
  time,
  reps;

  @override
  String toString() {
    switch (this) {
      case WorkoutMeasureDto.time:
        return "Time";
      case WorkoutMeasureDto.reps:
        return "Reps";
    }
  }
}

Map<String, WorkoutMeasureDto> stringMappedtoMeasure = {
  "time": WorkoutMeasureDto.time,
  "reps": WorkoutMeasureDto.reps,
};

class WorkoutMeasureDtoMapper {
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
