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

  factory MuscleMapModel.fromEntity(MuscleMapEntity muscleMap) {
    return MuscleMapModel(
      id: muscleMap.id,
      name: muscleMap.name,
    );
  }

  factory MuscleMapModel.fromDbModel(MuscleMap muscleMap) {
    return MuscleMapModel(
      id: muscleMap.id,
      name: muscleMap.name,
    );
  }

  MuscleMapEntity toEntity() {
    return MuscleMapEntity(
      id: id,
      name: name,
    );
  }

  MuscleMapsCompanion toCompanion() {
    return MuscleMapsCompanion(
      name: Value(name),
    );
  }
}
