import 'package:fit_chrono/src/features/home/presentation/home.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_map_form.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_maps.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  home,
  muscleMaps,
  muscleMapForm,
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
);
