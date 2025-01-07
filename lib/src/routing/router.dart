import 'dart:async';

import 'package:fit_chrono/src/core/constants/settings.dart';
import 'package:fit_chrono/src/features/home/presentation/home.screen.dart';
import 'package:fit_chrono/src/features/logs/presentation/logs.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_map_detail.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_map_form.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_maps.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/drift_debug.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/not_found.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/debugger_wrapper/debugger_wrapper.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/wave_runner.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/workout_form.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/workouts.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/workout_detail.screen.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/workout_wave_form.screen.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/workout_waves.screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/workout_wave_detail.screen.dart';

enum PAGES {
  driftDebug,
  notFound,
  home,
  muscleMaps,
  muscleMapForm,
  muscleMapDetail,
  workouts,
  workoutForm,
  workoutDetail,
  workoutWaves,
  workoutWavesForm,
  workoutWaveDetail,
  waveRunner,
  logs,
}

extension AppRoutesExtension on PAGES {
  String get path => switch (this) {
        PAGES.driftDebug => '/drift-debug',
        PAGES.notFound => '/*',
        PAGES.home => '/',
        PAGES.muscleMaps => '/muscle-map',
        PAGES.muscleMapForm => '/muscle-map-form',
        PAGES.muscleMapDetail => '/muscle-map-detail',
        PAGES.workouts => '/workouts',
        PAGES.workoutForm => '/workout-form',
        PAGES.workoutDetail => '/workout-detail',
        PAGES.workoutWaves => '/workout-waves',
        PAGES.workoutWavesForm => '/workout-waves-form',
        PAGES.workoutWaveDetail => '/workout-wave-detail',
        PAGES.waveRunner => '/wave-runner',
        PAGES.logs => '/logs',
      };

  String get name => switch (this) {
        PAGES.driftDebug => "Drift Debug",
        PAGES.notFound => "Not Found",
        PAGES.home => "Home",
        PAGES.muscleMaps => "Muscle Maps",
        PAGES.muscleMapForm => "Muscle Map Form",
        PAGES.muscleMapDetail => "Muscle Map Detail",
        PAGES.workouts => "Workouts",
        PAGES.workoutForm => "Workout Form",
        PAGES.workoutDetail => "Workout Detail",
        PAGES.workoutWaves => "Workout Waves",
        PAGES.workoutWavesForm => "Workout Waves Form",
        PAGES.workoutWaveDetail => "Workout Wave Detail",
        PAGES.waveRunner => "Wave Runner",
        PAGES.logs => "Logs",
      };

  Widget Function(BuildContext context, GoRouterState routerState)
      get builder => switch (this) {
            PAGES.driftDebug => (context, routerState) =>
                const DriftDebugScreen(),
            PAGES.notFound => (context, routerState) => const NotFoundScreen(),
            PAGES.home => (context, routerState) => const HomeScreen(),
            PAGES.muscleMaps => (context, routerState) =>
                const MuscleMapScreen(),
            PAGES.muscleMapForm => (context, routerState) =>
                const MuscleMapFormScreen(),
            PAGES.muscleMapDetail => (context, routerState) {
                final id = routerState.uri.queryParameters['id'];
                int? resultId;

                if (id != null) resultId = int.tryParse(id);

                return MuscleMapDetailScreen(
                  id: resultId,
                );
              },
            PAGES.workouts => (context, routerState) => const WorkoutsScreen(),
            PAGES.workoutForm => (context, routerState) {
                WorkoutDto? workout = routerState.extra as WorkoutDto?;
                return WorkoutFormScreen(
                  workout: workout,
                );
              },
            PAGES.workoutDetail => (context, routerState) {
                final id = routerState.uri.queryParameters['id'];
                int? resultId;

                if (id != null) resultId = int.tryParse(id);

                return WorkoutDetailScreen(
                  id: resultId,
                );
              },
            PAGES.workoutWaves => (context, routerState) =>
                const WorkoutWavesScreen(),
            PAGES.workoutWaveDetail => (context, routerState) {
                final id = routerState.uri.queryParameters['id'];
                int? resultId;
                if (id != null) resultId = int.tryParse(id);

                return WorkoutWaveDetailScreen(id: resultId);
              },
            PAGES.workoutWavesForm => (context, routerState) =>
                const WorkoutWaveFormScreen(),
            PAGES.waveRunner => (context, routerState) {
                final workoutWaveWithWorkouts =
                    routerState.extra as WorkoutWaveWithWorkoutsMeasureDto;
                return WaveRunnerScreen(
                  workoutWaveWithWorkouts: workoutWaveWithWorkouts,
                );
              },
            PAGES.logs => (context, routerState) => const LogsScreen(),
          };

  FutureOr<String?> Function(BuildContext context, GoRouterState state)
      get redirect => switch (this) {
            PAGES.driftDebug => (context, routerState) {
                if (!kDebugMode && !kHideDebugDb) return PAGES.notFound.path;
                return null;
              },
            _ => (context, routerState) => null,
          };
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        builder: (context, state) {
          final child = route.builder(context, state);
          if (kDebugMode &&
              (route.name != PAGES.driftDebug.name) &&
              !kHideDebugDb) {
            return DebuggerWrapper(child: child);
          }
          return child;
        },
      ),
    )
    .toList();

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
  errorBuilder: (context, state) => const NotFoundScreen(),
);
