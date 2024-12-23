import 'dart:io';

import 'package:drift/native.dart';
import 'package:drift/drift.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/dao/muscle_map.dao.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/init/muscle_map.data.dart';
import 'package:fit_chrono/src/features/muscle_maps/data/data_sources/local/schema/muscle_map.schema.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/local/dao/wave_runner.dao.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/dao/workout.dao.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/init/muscle_maps_for_workouts.data.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/init/workout.data.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/muscle_maps_for_workouts.schema.dart';
import 'package:fit_chrono/src/features/workout/data/data_sources/local/schema/workout.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/dao/workout_wave.dao.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/init/workout_wave.data.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/init/workouts_in_wave.data.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workout_wave.schema.dart';
import 'package:fit_chrono/src/features/workout_wave/data/data_sources/local/schema/workouts_in_wave.schema.dart';
import 'package:fit_chrono/src/features/wave_runner/data/data_sources/local/schema/wave_runner.schema.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as p;
import 'package:riverpod_annotation/riverpod_annotation.dart';
// ignore: depend_on_referenced_packages
import 'package:sqlite3/sqlite3.dart';
import 'package:sqlite3_flutter_libs/sqlite3_flutter_libs.dart';

part 'database.g.dart';

@DriftDatabase(
  tables: [
    MuscleMaps,
    Workouts,
    MuscleMapsForWorkouts,
    WorkoutWaves,
    WorkoutsInWaves,
    WorkoutsWithMeasures,
    WaveRunners,
  ],
  daos: [
    MuscleMapDao,
    WorkoutDao,
    WorkoutWaveDao,
    WaveRunnerDao,
  ],
)
class AppDatabase extends _$AppDatabase {
  AppDatabase() : super(_openConnection());

  @override
  int get schemaVersion => 1;

  @override
  MigrationStrategy get migration {
    return MigrationStrategy(
      onCreate: (Migrator m) async {
        await m.createAll();

        // enter initial data
        await transaction(() async {
          // muscle maps
          await batch((batch) {
            batch.insertAll(muscleMaps, initialMuscleMaps);

            // workouts
            batch.insertAll(workouts, initialWorkouts);

            // muscle maps for workouts
            batch.insertAll(
              muscleMapsForWorkouts,
              initialMuscleMapsForWorkouts,
            );

            // workouts with measure
            batch.insertAll(workoutsWithMeasures, initialWorkoutsWithMeasures);

            // workout wave
            batch.insertAll(workoutWaves, initialWorkoutWaves);

            // workouts in waves
            batch.insertAll(workoutsInWaves, initialWorkoutsInWaves);
          });
        });
      },
      onUpgrade: (Migrator m, int from, int to) async {
        if (from < 2) {
          // await m.createTable(tasks);
        }
      },
    );
  }
}

LazyDatabase _openConnection() {
  return LazyDatabase(() async {
    final dbFolder = await getApplicationDocumentsDirectory();
    final file = File(p.join(dbFolder.path, 'db.sqlite'));

    if (Platform.isAndroid) {
      await applyWorkaroundToOpenSqlite3OnOldAndroidVersions();
    }

    final cachebase = (await getTemporaryDirectory()).path;
    sqlite3.tempDirectory = cachebase;

    return NativeDatabase.createInBackground(file);
  });
}

@Riverpod(keepAlive: true)
AppDatabase db(Ref ref) {
  return AppDatabase();
}
