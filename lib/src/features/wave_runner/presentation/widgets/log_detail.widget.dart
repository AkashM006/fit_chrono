import 'package:fit_chrono/src/core/constants/extensions.dart';
import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_card/custom_card.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/dto/wave_runner_log.dto.dart';
import 'package:flutter/material.dart';

class LogDetailWidget extends StatelessWidget {
  const LogDetailWidget({
    super.key,
    required this.log,
  });

  final WaveRunnerLogDto log;

  @override
  Widget build(BuildContext context) {
    final workoutStatusMap =
        log.workoutWithWorkoutMeasureLogs.fold<Map<String, int>>(
      {
        "skipped": 0,
        "completed": 0,
      },
      (previousValue, workoutLog) {
        if (workoutLog.workoutWithMeasure.workout.isRest) return previousValue;

        if (workoutLog.wasSkipped) {
          previousValue["skipped"] = previousValue["skipped"]! + 1;
        } else {
          previousValue["completed"] = previousValue["completed"]! + 1;
        }
        return previousValue;
      },
    );

    return Column(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Text(
          log.workoutWaveWithWorkoutsMeasure.workoutWave.name,
          style: context.textTheme.headlineMedium,
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Total Time Elapsed: ${log.totalTimeElapsed.formattedTime()}",
          style: context.textTheme.bodyLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          children: [
            Text("Completed: ${workoutStatusMap["completed"]}"),
            const SizedBox(
              width: 10,
            ),
            Text("Skipped: ${workoutStatusMap["skipped"]}"),
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          spacing: 5,
          children: log.workoutWithWorkoutMeasureLogs.map(
            (workoutLog) {
              return _buildWorkoutLog(context, workoutLog);
            },
          ).toList(),
        ),
      ],
    );
  }

  Widget _buildWorkoutLog(
    BuildContext context,
    WorkoutWithWorkoutMeasureLogDto workoutLog,
  ) {
    final currentWorkout = workoutLog.workoutWithMeasure.workout;

    return CustomCardWidget(
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              currentWorkout.name,
              style: context.textTheme.bodyLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
            if (!currentWorkout.isRest) ...[
              const SizedBox(
                height: 5,
              ),
              Text(
                workoutLog.workoutWithMeasure.workoutMeasure.isTime
                    ? workoutLog.workoutWithMeasure.count.formattedTime()
                    : "x${workoutLog.workoutWithMeasure.count}",
                style: context.textTheme.bodyMedium,
              ),
            ],
            const SizedBox(
              height: 10,
            ),
            Text("Elapsed Time: ${workoutLog.elapsedTime.formattedTime()}"),
            const SizedBox(
              height: 5,
            ),
            if (!currentWorkout.isRest)
              workoutLog.wasSkipped
                  ? const Text("Skipped ❌")
                  : const Text("Nailed It! 🔥"),
          ],
        ),
      ),
    );
  }
}
