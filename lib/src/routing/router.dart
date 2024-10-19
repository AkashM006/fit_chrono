import 'package:fit_chrono/src/features/home/presentation/home.screen.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/muscle_maps.screen.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum PAGES {
  home,
  muscleMaps,
}

extension AppRoutesExtension on PAGES {
  String get path {
    switch (this) {
      case PAGES.home:
        return '/';
      case PAGES.muscleMaps:
        return '/muscle-map';
    }
  }

  String get name {
    switch (this) {
      case PAGES.home:
        return "Home";
      case PAGES.muscleMaps:
        return "Muscle Maps";
    }
  }

  Widget Function(BuildContext context, GoRouterState routerState) get builder {
    switch (this) {
      case PAGES.home:
        return (context, routerState) => const HomeScreen();
      case PAGES.muscleMaps:
        return (context, routerState) => const MuscleMapScreen();
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
