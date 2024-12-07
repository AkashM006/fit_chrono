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
    this.nextWorkoutName,
    this.nextWorkoutCount,
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
    this.nextWorkoutName,
    this.nextWorkoutCount,
    this.showExitInTimer = false,
    this.showSkipInTimer = false,
  }) : reps = null;

  final String actionTitle;
  final String workoutTitle;
  final String beTitle;

  final Duration? duration;
  final int? reps;

  final bool showSkipInTimer;
  final bool showExitInTimer;

  final void Function() onSkip;
  final void Function() onExit;

  // properties related to timer
  final bool? isPaused;
  final void Function()? onTimerPause;
  final void Function()? onTimerResume;

  final String? nextWorkoutName;
  final String? nextWorkoutCount;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    final counterWidget = duration != null
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

    final List<Widget> upcomingWorkoutWidgetList = [];
    final textStyleInButton =
        OutlinedButton.styleFrom(textStyle: textTheme.bodyLarge);

    if (nextWorkoutName != null) {
      upcomingWorkoutWidgetList.add(const SizedBox(
        height: 50,
      ));
      upcomingWorkoutWidgetList.add(Text(
        "Coming Up",
        style: textTheme.headlineLarge!.copyWith(fontWeight: FontWeight.bold),
      ));
      upcomingWorkoutWidgetList.add(const SizedBox(
        height: 10,
      ));
      upcomingWorkoutWidgetList.add(Text(
        nextWorkoutName!,
        style: textTheme.headlineSmall,
      ));
      upcomingWorkoutWidgetList.add(const SizedBox(
        height: 5,
      ));
      upcomingWorkoutWidgetList.add(Text(
        nextWorkoutCount!,
        style: textTheme.bodyLarge!.copyWith(
          fontWeight: FontWeight.w300,
        ),
      ));
    }

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Expanded(
            flex: 2,
            child: SizedBox.shrink(),
          ),
          Column(
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
              counterWidget,
            ],
          ),
          const Expanded(
            flex: 1,
            child: SizedBox.shrink(),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Align(
              alignment: Alignment.topLeft,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: upcomingWorkoutWidgetList,
              ),
            ),
          ),
          if (!showExitInTimer || !showSkipInTimer)
            Column(
              children: [
                const SizedBox(
                  height: 20,
                ),
                if (!showSkipInTimer)
                  OutlinedButton(
                    onPressed: onSkip,
                    style: textStyleInButton,
                    child: const Text("Skip"),
                  ),
                if (!showSkipInTimer)
                  const SizedBox(
                    height: 10,
                  ),
                if (!showExitInTimer)
                  TextButton(
                    onPressed: onExit,
                    style: TextButton.styleFrom(textStyle: textTheme.bodyLarge),
                    child: const Text("Exit"),
                  )
              ],
            ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
