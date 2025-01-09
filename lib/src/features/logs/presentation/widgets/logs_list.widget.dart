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

    void onRedirect(int id) {
      context.pushNamed(PAGES.logDetail.name, queryParameters: {
        'id': id.toString(),
      });
    }

    return ListView.builder(
      itemCount: logs.length,
      itemBuilder: (context, index) {
        final log = logs[index];
        return CustomCardWidget(
          onTap: () => onRedirect(log.id),
          child: Container(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      log.workoutWaveWithWorkoutsMeasure.workoutWave.name,
                      style: textTheme.titleLarge,
                    ),
                    const Icon(Icons.arrow_right),
                  ],
                ),
                Row(
                  spacing: 5,
                  children: [
                    Text(log.createdAt.formattedDate),
                    Text(
                      "\u2022",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(log.totalTimeElapsed.formattedTime)
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
