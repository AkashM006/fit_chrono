import 'package:fit_chrono/src/features/shared/data/data_sources/db/database.dart';

class WorkoutEntity {
  final int id;
  final String name;
  final List<MuscleMap> muscles;
  final WorkoutMeasureEntity mesaure;
  final int count;

  const WorkoutEntity({
    required this.id,
    required this.name,
    required this.muscles,
    required this.mesaure,
    required this.count,
  });
}

enum WorkoutMeasureEntity {
  time,
  reps,
}
