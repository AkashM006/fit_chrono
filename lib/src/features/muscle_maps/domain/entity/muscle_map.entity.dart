abstract class MuscleMapEntity {
  int get id;
  String get name;

  const MuscleMapEntity({
    required int id,
    required String name,
  });

  MuscleMapEntity copyWith({
    int? id,
    String? name,
  });
}
