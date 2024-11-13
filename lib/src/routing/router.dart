import 'package:fit_chrono/src/features/home/presentation/home.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_map_detail.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_map_form.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_maps.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/not_found.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/workout_form.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/workouts.screen.dart';
import 'package:fit_chrono/src/features/workout/presentation/workout_detail.screen.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/workout_wave_form.screen.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/workout_waves.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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
  notFound,
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
        return (context, routerState) => const WorkoutFormScreen();
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
      case PAGES.workoutWavesForm:
        return (context, routerState) => const WorkoutWaveFormScreen();
      case PAGES.notFound:
        return (context, routerState) => const NotFoundScreen();
    }
  }
}

final List<RouteBase> routes = PAGES.values
    .map(
      (route) => GoRoute(
        path: route.path,
        name: route.name,
        builder: route.builder,
      ),
    )
    .toList();

final navigatorKey = GlobalKey<NavigatorState>();

final router = GoRouter(
  navigatorKey: navigatorKey,
  routes: routes,
  errorBuilder: (context, state) => const NotFoundScreen(),
);
