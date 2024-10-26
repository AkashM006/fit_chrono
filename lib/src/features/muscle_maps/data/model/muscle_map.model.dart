import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class MuscleMapModel {
  int _id;
  String _name;

  MuscleMapModel({
    required id,
    required name,
  })  : _id = id,
        _name = name;

  int get id => _id;

  String get name => _name;

  factory MuscleMapModel.fromEntity(MuscleMapEntity muscleMapEntity) {
    return MuscleMapModel(
      id: muscleMapEntity.id,
      name: muscleMapEntity.name,
    );
  }

  MuscleMapEntity toEntity() {
    return MuscleMapEntity(
      id: id,
      name: name,
    );
  }

  MuscleMapModel copyWith({int? id, String? name}) {
    return MuscleMapModel(
      id: id ?? this.id,
      name: name ?? this.name,
    );
  }
}
