import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final routeItems = [
  {
    'emoji': "💪",
    'title': "Muscle Maps",
    'path': PAGES.muscleMaps.path,
  },
  {
    'emoji': "🏋️",
    'title': "Workouts",
    'path': PAGES.workouts.path,
  },
  {
    'emoji': "🌊",
    'title': "Workout Waves",
    'path': PAGES.workoutWaves.path,
  },
  {
    'emoji': "📝",
    'title': "Logs",
    'path': PAGES.logs.path,
  }
];

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void handleRouting(String path) {
      context.pop();
      context.push(path);
    }

    final drawerItemTextTheme = Theme.of(context).textTheme.titleLarge;

    List<Widget> drawerItems = routeItems.map((routeItem) {
      return ListTile(
        leading: Text(
          routeItem['emoji'] as String,
          style: drawerItemTextTheme,
        ),
        title: Text(
          routeItem['title'] as String,
          style: drawerItemTextTheme,
        ),
        onTap: () => handleRouting(routeItem['path'] as String),
      );
    }).toList();

    return Drawer(
      child: ListView(
        padding: const EdgeInsets.all(0),
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.primaryContainer,
            ),
            child: Text(
              "Hi User",
              style: Theme.of(context).textTheme.headlineSmall,
            ),
          ),
          ...drawerItems,
        ],
      ),
    );
  }
}
