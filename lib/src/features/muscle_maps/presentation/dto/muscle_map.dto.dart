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
  }) {
    return MuscleMapDto(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }

  factory MuscleMapDto.init() {
    return MuscleMapDto(
      name: "",
    );
  }

  factory MuscleMapDto.fromEntity(MuscleMapEntity entity) {
    return MuscleMapDto(
      id: entity.id,
      name: entity.name,
    );
  }

  MuscleMapEntity toEntity() {
    return MuscleMapEntity(
      id: id,
      name: name,
    );
  }

  @override
  bool operator ==(covariant MuscleMapDto other) {
    return id == other.id && name == other.name;
  }

  @override
  int get hashCode => Object.hash(id, name);
}
