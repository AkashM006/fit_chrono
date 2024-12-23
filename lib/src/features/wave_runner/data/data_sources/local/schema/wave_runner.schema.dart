import 'package:drift/drift.dart';

class WaveRunners extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get log => text()();
}
