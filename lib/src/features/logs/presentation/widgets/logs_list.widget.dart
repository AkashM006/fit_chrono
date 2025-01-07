import 'package:fit_chrono/src/core/constants/extensions.dart';
import 'package:fit_chrono/src/features/logs/presentation/dto/logs.dto.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_card/custom_card.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/full_screen_msg/full_screen_msg.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class LogsListWidget extends StatelessWidget {
  const LogsListWidget({
    super.key,
    required this.logs,
  });

  final List<WaveRunnerLogDto> logs;

  @override
  Widget build(BuildContext context) {
    final textTheme = context.textTheme;

    void onNavigateToWaves() {
      context.push(PAGES.workoutWaves.path);
    }

    if (logs.isEmpty) {
      return FullScreenMsgWidget(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "📝",
              style: textTheme.displayMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "No Logs Yet!",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Your journey begins when you complete your first workout wave. Crush it, and we'll start keeping track of your triumphs!",
              textAlign: TextAlign.center,
              style: textTheme.bodyLarge,
            ),
            const SizedBox(
              height: 30,
            ),
            TextButton(
              onPressed: onNavigateToWaves,
              child: const Text("Explore Waves 🌊"),
            ),
          ],
        ),
      );
    }

    return ListView.builder(
        itemCount: logs.length,
        itemBuilder: (context, index) {
          final log = logs[index];
          // todo: Start styling
          return CustomCardWidget(
            child: Text(log.workoutWaveWithWorkoutsMeasure.workoutWave.name),
          );
        });
  }
}
