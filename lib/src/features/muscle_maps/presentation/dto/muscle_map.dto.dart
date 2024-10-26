import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class MuscleMapDto {
  final int _id;
  final String _name;

  int get id => _id;
  String get name => _name;

  MuscleMapDto({
    id = -1,
    required name,
  })  : _id = id,
        _name = name;

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
}
