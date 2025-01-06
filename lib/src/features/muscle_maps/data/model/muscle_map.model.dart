import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

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

  factory MuscleMapModel.fromEntity(MuscleMapEntity muscleMap) =>
      MuscleMapModel(
        id: muscleMap.id,
        name: muscleMap.name,
      );

  factory MuscleMapModel.fromDbModel(MuscleMap muscleMap) => MuscleMapModel(
        id: muscleMap.id,
        name: muscleMap.name,
      );

  factory MuscleMapModel.fromJson(Map<String, dynamic> json) => MuscleMapModel(
        id: json['id'] as int,
        name: json['name'] as String,
      );

  MuscleMapEntity toEntity() => MuscleMapEntity(
        id: id,
        name: name,
      );

  MuscleMapsCompanion toCompanion() => MuscleMapsCompanion(
        name: Value(name),
      );

  @override
  bool operator ==(covariant MuscleMapModel other) => name == other.name;

  @override
  int get hashCode => name.hashCode;

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
      };
}
