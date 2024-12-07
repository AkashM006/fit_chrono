import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/timer_display.widget.dart';
import 'package:flutter/material.dart';

class WaveWidget extends StatelessWidget {
  const WaveWidget.reps({
    super.key,
    required this.actionTitle,
    required this.workoutTitle,
    required this.beTitle,
    required this.reps,
    required this.onSkip,
    required this.onExit,
  })  : duration = null,
        onTimerPause = null,
        onTimerResume = null,
        isPaused = null,
        showExitInTimer = false,
        showSkipInTimer = false;

  const WaveWidget.time({
    super.key,
    required this.actionTitle,
    required this.workoutTitle,
    required this.beTitle,
    required this.duration,
    required this.isPaused,
    required this.onTimerPause,
    required this.onTimerResume,
    required this.onSkip,
    required this.onExit,
    this.showExitInTimer = false,
    this.showSkipInTimer = false,
  }) : reps = null;

  final String actionTitle;
  final String workoutTitle;
  final String beTitle;

  final Duration? duration;
  final int? reps;

  // properties related to timer
  final bool? isPaused;
  final void Function()? onTimerPause;
  final void Function()? onTimerResume;

  final bool showSkipInTimer;
  final bool showExitInTimer;

  final void Function() onSkip;
  final void Function() onExit;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final conterWidget = duration != null
        ? TimerDisplayWidget(
            time: duration!,
            onPause: onTimerPause!,
            onResume: onTimerResume!,
            isPaused: isPaused!,
            onSkip: onSkip,
            onExit: onExit,
            showExit: showExitInTimer,
            showSkip: showSkipInTimer,
          )
        : const Text("Reps");

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            actionTitle,
            style: textTheme.headlineMedium,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            workoutTitle,
            style: textTheme.headlineLarge,
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            beTitle,
            style: textTheme.headlineSmall,
          ),
          const SizedBox(
            height: 30,
          ),
          conterWidget,
        ],
      ),
    );
  }
}
