import 'package:drift/drift.dart';

class MuscleMaps extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get name => text()();
}
