import 'dart:async';

import 'package:fit_chrono/src/core/constants/settings.dart';
import 'package:fit_chrono/src/features/home/presentation/home.screen.dart';
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
  driftDebug,
  notFound,
  waveRunner,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.muscleMaps:
        return '/muscle-map';
      case PAGES.muscleMapForm:
        return '/muscle-map-form';
      case PAGES.muscleMapDetail:
        return '/muscle-map-detail';
      case PAGES.workouts:
        return '/workouts';
      case PAGES.workoutForm:
        return '/workout-form';
      case PAGES.workoutDetail:
        return '/workout-detail';
      case PAGES.workoutWaves:
        return '/workout-waves';
      case PAGES.workoutWavesForm:
        return '/workout-waves-form';
      case PAGES.workoutWaveDetail:
        return '/workout-wave-detail';
      case PAGES.waveRunner:
        return '/wave-runner';
      case PAGES.driftDebug:
        return '/drift-debug';
      case PAGES.notFound:
        return '/*';
    }
  }

  String get name {
    switch (this) {
      case PAGES.home:
        return "Home";
      case PAGES.muscleMaps:
        return "Muscle Maps";
      case PAGES.muscleMapForm:
        return "Muscle Map Form";
      case PAGES.muscleMapDetail:
        return "Muscle Map Detail";
      case PAGES.workouts:
        return "Workouts";
      case PAGES.workoutForm:
        return "Workout Form";
      case PAGES.workoutDetail:
        return "Workout Detail";
      case PAGES.workoutWaves:
        return "Workout Waves";
      case PAGES.workoutWavesForm:
        return "Workout Waves Form";
      case PAGES.workoutWaveDetail:
        return "Workout Wave Detail";
      case PAGES.waveRunner:
        return "Wave Runner";
      case PAGES.driftDebug:
        return "Drift Debug";
      case PAGES.notFound:
        return "Not Found";
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.home:
        return (context, routerState) => const HomeScreen();
      case PAGES.muscleMaps:
        return (context, routerState) => const MuscleMapScreen();
      case PAGES.muscleMapForm:
        return (context, routerState) => const MuscleMapFormScreen();
      case PAGES.muscleMapDetail:
        return (context, routerState) {
          final id = routerState.uri.queryParameters['id'];
          int? resultId;

          if (id != null) resultId = int.tryParse(id);

          return MuscleMapDetailScreen(
            id: resultId,
          );
        };
      case PAGES.workouts:
        return (context, routerState) => const WorkoutsScreen();
      case PAGES.workoutForm:
        return (context, routerState) {
          WorkoutDto? workout = routerState.extra as WorkoutDto?;
          return WorkoutFormScreen(
            workout: workout,
          );
        };
      case PAGES.workoutDetail:
        return (context, routerState) {
          final id = routerState.uri.queryParameters['id'];
          int? resultId;

          if (id != null) resultId = int.tryParse(id);

          return WorkoutDetailScreen(
            id: resultId,
          );
        };
      case PAGES.workoutWaves:
        return (context, routerState) => const WorkoutWavesScreen();
      case PAGES.workoutWaveDetail:
        return (context, routerState) {
          final id = routerState.uri.queryParameters['id'];
          int? resultId;
          if (id != null) resultId = int.tryParse(id);

          return WorkoutWaveDetailScreen(id: resultId);
        };
      case PAGES.workoutWavesForm:
        return (context, routerState) => const WorkoutWaveFormScreen();
      case PAGES.waveRunner:
        return (context, routerState) {
          final workoutWave =
              routerState.extra as WorkoutWaveWithWorkoutsMeasureDto;
          return WaveRunnerScreen(
            workoutWave: workoutWave,
          );
        };
      case PAGES.driftDebug:
        return (context, routerState) => const DriftDebugScreen();
      case PAGES.notFound:
        return (context, routerState) => const NotFoundScreen();
    }
  }

  FutureOr<String?> Function(BuildContext context, GoRouterState state)
      get redirect {
    switch (this) {
      case PAGES.driftDebug:
        return (context, routerState) {
          if (!kDebugMode && !kHideDebugDb) return PAGES.notFound.path;
          return null;
        };
      default:
        return (context, routerState) => null;
    }
  }
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
