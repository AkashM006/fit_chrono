import 'package:fit_chrono/src/features/shared/presentation/entity_not_found.screen.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onBack() {
      if (context.canPop()) {
        context.pop();
      } else {
        context.go(PAGES.home.path);
      }
    }

    void onHome() {
      context.go(PAGES.home.path);
    }

    return EntityNotFoundScreen(
      title: "🚧",
      content:
          "Oops! Looks like you wandered off the workout trail. Let's get you back to the action!",
      actions: [
        TextButton(onPressed: onHome, child: const Text("Home")),
        const SizedBox(
          width: 20,
        ),
        OutlinedButton(onPressed: onBack, child: const Text("Back")),
      ],
    );
  }
}
