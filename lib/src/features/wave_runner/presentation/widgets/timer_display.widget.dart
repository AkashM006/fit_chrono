import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:flutter/material.dart';

class TimerDisplayWidget extends StatelessWidget {
  const TimerDisplayWidget({
    super.key,
    required this.time,
    required this.onPause,
    required this.onResume,
    required this.onExit,
    required this.onSkip,
    required this.isPaused,
    this.showExit = false,
    this.showSkip = false,
  });

  final Duration time;
  final void Function() onPause;
  final void Function() onResume;
  final void Function() onExit;
  final void Function() onSkip;
  final bool isPaused;

  final bool showExit;
  final bool showSkip;

  @override
  Widget build(BuildContext context) {
    const maxIconSize = 60.0;
    final iconSize = SizeConfig.safeBlockVertical * 5 > maxIconSize
        ? SizeConfig.safeBlockVertical * 5
        : maxIconSize;
    final iconColor = Theme.of(context).colorScheme.primary;

    final statusButton = !isPaused
        ? IconButton(
            onPressed: onPause,
            icon: Icon(
              Icons.pause,
              color: iconColor,
              size: iconSize,
            ),
          )
        : IconButton(
            onPressed: onResume,
            icon: Icon(
              Icons.play_arrow,
              color: iconColor,
              size: iconSize,
            ),
          );

    return Column(
      children: [
        Text(
          getFormattedTime(time),
          style: Theme.of(context).textTheme.headlineLarge,
        ),
        const SizedBox(
          height: 20,
        ),
        statusButton,
        if (showExit)
          const SizedBox(
            height: 10,
          ),
        if (showExit)
          TextButton(
            onPressed: onExit,
            style: TextButton.styleFrom(
                textStyle: Theme.of(context).textTheme.bodyLarge),
            child: const Text("Exit"),
          ),
        if (showSkip)
          const SizedBox(
            height: 20,
          ),
        if (showSkip)
          OutlinedButton(
            onPressed: onSkip,
            style: OutlinedButton.styleFrom(
              textStyle: Theme.of(context).textTheme.bodyLarge,
            ),
            child: const Text(
              "Skip",
            ),
          ),
      ],
    );
  }
}
