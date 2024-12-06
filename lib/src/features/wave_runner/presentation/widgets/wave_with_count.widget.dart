import 'dart:async';

import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';

const oneSecond = Duration(seconds: 1);

class WaveWithCountWidget extends StatefulWidget {
  const WaveWithCountWidget({
    super.key,
    required this.workoutWithMeasureDto,
    required this.workoutWave,
    required this.onSkip,
    required this.onComplete,
  }) : isStart = false;

  const WaveWithCountWidget.start({
    super.key,
    required this.workoutWave,
    required this.onSkip,
    required this.onComplete,
  })  : workoutWithMeasureDto = null,
        isStart = true;
  final WorkoutWithMeasureDto? workoutWithMeasureDto;
  final WorkoutWaveDto workoutWave;
  final void Function() onSkip;
  final void Function() onComplete;

  final bool isStart;

  @override
  State<WaveWithCountWidget> createState() => _WaveWithCountWidgetState();
}

class _WaveWithCountWidgetState extends State<WaveWithCountWidget> {
  late Duration? _remainingTime;
  late Timer? _timer;
  bool _isPaused = true;

  @override
  void initState() {
    super.initState();
    if (widget.isStart) {
      _remainingTime = const Duration(seconds: 15);
      resumeTimer();
    } else {
      _remainingTime = Duration.zero;
    }
  }

  @override
  void dispose() {
    super.dispose();
    if (_timer != null) _timer!.cancel();
  }

  void resumeTimer() {
    setState(() {
      _isPaused = false;
    });
    _timer = Timer.periodic(
      oneSecond,
      (timer) {
        if (_remainingTime!.inSeconds > 0) {
          setState(() {
            _remainingTime = _remainingTime! - oneSecond;
            _isPaused = false;
          });
        } else {
          stopTimer();
          widget.onComplete();
        }
      },
    );
  }

  void stopTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer!.cancel();
  }

  void onExit() {}

  @override
  Widget build(BuildContext context) {
    if (widget.isStart) {
      return WaveWidget.time(
        actionTitle: "Starting",
        workoutTitle: widget.workoutWave.name,
        beTitle: "in",
        duration: _remainingTime,
        isPaused: _isPaused,
        onTimerPause: stopTimer,
        onTimerResume: resumeTimer,
        onExit: onExit,
        onSkip: widget.onSkip,
      );
    }

    return Center(
      child: Text(
        widget.workoutWithMeasureDto!.workout.name,
      ),
    );
  }
}
