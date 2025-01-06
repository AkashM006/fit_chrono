import 'package:drift/drift.dart';

class WaveRunnerLogs extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get log => text()();
}
