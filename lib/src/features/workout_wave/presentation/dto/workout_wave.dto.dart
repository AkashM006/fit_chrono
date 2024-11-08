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

  factory WorkoutWaveDto.fromEntity(WorkoutWaveEntity entity) {
    return WorkoutWaveDto(
      id: entity.id,
      name: entity.name,
      times: entity.times,
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
