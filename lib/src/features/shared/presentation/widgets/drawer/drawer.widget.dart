import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onMuscleMapNavigation() {
      context.pop();
      context.push(PAGES.muscleMaps.path);
    }

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
          ListTile(
            onTap: onMuscleMapNavigation,
            title: const Text("Muscle Maps"),
          )
        ],
      ),
    );
  }
}
