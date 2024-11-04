import 'package:drift/drift.dart';

class Workouts extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
  // IntColumn get repitition => integer()();
  // TextColumn get repititionType => text()();
}
