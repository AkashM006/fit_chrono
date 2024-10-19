import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';

class MuscleMapModel extends MuscleMapEntity {
  int _id;
  String _name;

  MuscleMapModel({
    required super.id,
    required super.name,
  })  : _id = id,
        _name = name;

  @override
  int get id => _id;

  @override
  String get name => _name;

  factory MuscleMapModel.fromEntity(MuscleMapEntity muscleMapEntity) {
    return MuscleMapModel(
      id: muscleMapEntity.id,
      name: muscleMapEntity.name,
    );
  }
}
