import 'package:fit_chrono/src/core/constants/extensions.dart';
import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WaveCompleteWidget extends StatelessWidget {
  const WaveCompleteWidget({
    super.key,
    required this.timeTaken,
    required this.workoutsCompleted,
  });

  final Duration timeTaken;
  final int workoutsCompleted;

  @override
  Widget build(BuildContext context) {
    final statsFont = context.textTheme.headlineSmall;

    void onComplete() {
      context.pop();
    }

    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("🌊", style: context.textTheme.displayLarge),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Wave Surfed!",
              style: context.textTheme.displaySmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Great job! You gave it your all and completed another wave. Every rep and second counts toward your success—keep pushing forward! 💪",
              style: context.textTheme.bodyLarge,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 40,
            ),
            Text(
              "Time Elapsed: ${getFormattedTime(timeTaken)}",
              style: statsFont,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "Workouts Completed: $workoutsCompleted/$workoutsCompleted",
              style: statsFont,
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: onComplete,
              style:
                  TextButton.styleFrom(textStyle: context.textTheme.bodyLarge),
              child: const Text("Back to Waves 🌊"),
            ),
          ],
        ),
      ),
    );
  }
}
