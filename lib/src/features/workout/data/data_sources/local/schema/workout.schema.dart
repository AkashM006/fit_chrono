import 'package:drift/drift.dart';

class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}

class WorkoutsWithMeasures extends Table {
  IntColumn get id => integer().autoIncrement()();
  IntColumn get workoutId =>
      integer().references(Workouts, #id, onDelete: KeyAction.cascade)();
  IntColumn get repitition => integer()();
  TextColumn get repititionType => text()();

  @override
  List<Set<Column>> get uniqueKeys => [
        {workoutId, repitition, repititionType}
      ];
}
