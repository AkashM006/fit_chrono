import 'package:drift/drift.dart';

class WorkoutWaves extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  IntColumn get times => integer().withDefault(const Constant(0))();
}
