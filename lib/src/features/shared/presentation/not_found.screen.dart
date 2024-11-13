import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NotFoundScreen extends StatelessWidget {
  const NotFoundScreen({super.key});

  @override
  Widget build(BuildContext context) {
    void onBack() {
      if (context.canPop()) context.pop();
    }

    void onHome() {
      context.go(PAGES.home.path);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Whoops!"),
      ),
      body: Center(
        child: ConstrainedBox(
          constraints: AppOffsets.messageWidthConstaint,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "🚧",
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Oops! Looks like you wandered off the workout trail. Let's get you back to the action!",
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(onPressed: onHome, child: const Text("Home")),
                  const SizedBox(
                    width: 20,
                  ),
                  OutlinedButton(onPressed: onBack, child: const Text("Back")),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
