import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class MuscleMapDto {
  final int _id;
  final String _name;

  int get id => _id;
  String get name => _name;

  MuscleMapDto({
    int id = -1,
    required String name,
  })  : _id = id,
        _name = name;

  MuscleMapDto copyWith({
    int? id,
    String? name,
  }) =>
      MuscleMapDto(
        id: id ?? this.id,
        name: name ?? this.name,
      );

  factory MuscleMapDto.init() => MuscleMapDto(
        name: "",
      );

  factory MuscleMapDto.fromEntity(MuscleMapEntity entity) => MuscleMapDto(
        id: entity.id,
        name: entity.name,
      );

  MuscleMapEntity toEntity() => MuscleMapEntity(
        id: id,
        name: name,
      );

  @override
  bool operator ==(covariant MuscleMapDto other) =>
      id == other.id && name == other.name;

  @override
  int get hashCode => Object.hash(id, name);
}
