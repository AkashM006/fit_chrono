import 'dart:async';

import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/timer_display.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';

const oneSecond = Duration(seconds: 1);

class StartWaveWidget extends StatefulWidget {
  const StartWaveWidget({
    super.key,
    required this.onTimerComplete,
    required this.workoutWave,
    required this.nextWorkout,
  });

  final void Function() onTimerComplete;
  final WorkoutWaveDto workoutWave;
  final WorkoutWithMeasureDto nextWorkout;

  @override
  State<StartWaveWidget> createState() => _StartWaveWidgetState();
}

class _StartWaveWidgetState extends State<StartWaveWidget> {
  late Duration _remainingTime;
  late Timer _timer;
  bool isPaused = true;

  @override
  void initState() {
    super.initState();
    _remainingTime = const Duration(seconds: 15);
    resumeTimer();
  }

  void resumeTimer() {
    isPaused = false;
    _timer = Timer.periodic(
      oneSecond,
      (timer) {
        if (_remainingTime.inSeconds > 0) {
          setState(() {
            _remainingTime -= oneSecond;
          });
        } else {
          stopTimer();
        }
      },
    );
  }

  void stopTimer() {
    setState(() {
      isPaused = true;
    });
    _timer.cancel();
  }

  void onExit() {
    // todo: Handle onExit
  }

  void onSkip() {
    // todo: handle onSkip
  }

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;

    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Starting",
              style: textTheme.headlineMedium,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              widget.workoutWave.name,
              style: textTheme.headlineLarge,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              "in",
              style: textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 50,
            ),
            TimerDisplayWidget(
              time: _remainingTime,
              onPause: stopTimer,
              onResume: resumeTimer,
              isPaused: isPaused,
              onSkip: onSkip,
              onExit: onExit,
            ),
          ],
        ),
      ),
    );
  }
}
