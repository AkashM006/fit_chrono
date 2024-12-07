import 'dart:async';

import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/workout_wave_exit.dialog.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

const oneSecond = Duration(seconds: 1);

class WaveWithCountWidget extends StatefulWidget {
  const WaveWithCountWidget({
    super.key,
    required this.workoutWithMeasureDto,
    required this.workoutWave,
    required this.onSkip,
    required this.onComplete,
    this.nextWorkoutWithMeasureDto,
  }) : isStart = false;

  const WaveWithCountWidget.start({
    super.key,
    required this.workoutWave,
    required this.onSkip,
    required this.onComplete,
    required this.nextWorkoutWithMeasureDto,
  })  : workoutWithMeasureDto = null,
        isStart = true;
  final WorkoutWithMeasureDto? workoutWithMeasureDto;
  final WorkoutWaveDto workoutWave;
  final void Function() onSkip;
  final void Function() onComplete;
  final WorkoutWithMeasureDto? nextWorkoutWithMeasureDto;

  final bool isStart;

  @override
  State<WaveWithCountWidget> createState() => _WaveWithCountWidgetState();
}

class _WaveWithCountWidgetState extends State<WaveWithCountWidget> {
  late Duration? _remainingTime;
  late Timer? _timer;
  late bool _isPaused;
  late bool isTimeBased;

  @override
  void initState() {
    super.initState();
    _isPaused = false;
    final currentWorkout = widget.workoutWithMeasureDto;
    if (widget.isStart || widget.workoutWithMeasureDto!.workoutMeasure.isTime) {
      _remainingTime = widget.isStart
          ? const Duration(seconds: 15)
          : Duration(seconds: currentWorkout!.count);
      isTimeBased = true;
      resumeTimer();
      return;
    }
    _remainingTime = Duration.zero;
    isTimeBased = false;
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

  void onExit() async {
    if (isTimeBased) {
      stopTimer();
    }

    final isQuitting = await showWorkoutWaveExitDialog(context);
    if (!isQuitting) {
      resumeTimer();
      return;
    }

    if (!mounted) return;
    context.pop();
  }

  void onAddTenSeconds() {
    setState(() {
      _remainingTime = _remainingTime! + const Duration(seconds: 10);
    });
  }

  @override
  Widget build(BuildContext context) {
    void onPopInvokedWithResult(didPop, result) {
      if (didPop) return;
      onExit();
    }

    final String? nextWorkoutName =
        widget.nextWorkoutWithMeasureDto?.workout.name;
    String? nextWorkoutCount;

    if (widget.nextWorkoutWithMeasureDto != null) {
      if (isTimeBased) {
        nextWorkoutCount = getFormattedTime(
            Duration(seconds: widget.nextWorkoutWithMeasureDto!.count));
      } else {
        nextWorkoutCount = '${widget.nextWorkoutWithMeasureDto!.count}x';
      }
    }

    if (widget.isStart) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: WaveWidget.time(
          actionTitle: "Starting",
          workoutTitle: widget.workoutWave.name,
          beTitle: "in",
          duration: _remainingTime,
          isPaused: _isPaused,
          onTimerPause: stopTimer,
          onTimerResume: resumeTimer,
          onExit: onExit,
          onSkip: widget.onSkip,
          showExitInTimer: true,
          showSkipInTimer: true,
          nextWorkoutName: nextWorkoutName,
          nextWorkoutCount: nextWorkoutCount,
        ),
      );
    }

    final isRest = widget.workoutWithMeasureDto!.workout.isRest;

    final actionTitle = isRest ? "" : "Doing";
    final workoutTitle =
        isRest ? "Resting" : widget.workoutWithMeasureDto!.workout.name;
    const beTitle = "for";

    if (isTimeBased) {
      // todo: for rest also add options to increase the time
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: WaveWidget.time(
          actionTitle: actionTitle,
          workoutTitle: workoutTitle,
          beTitle: beTitle,
          duration: _remainingTime,
          isPaused: _isPaused,
          onTimerPause: stopTimer,
          onTimerResume: resumeTimer,
          onSkip: widget.onSkip,
          onExit: onExit,
          nextWorkoutName: nextWorkoutName,
          nextWorkoutCount: nextWorkoutCount,
          showTimeAddition: isRest,
          onAddTime: onAddTenSeconds,
        ),
      );
    }

    return Center(
      child: Text(
        widget.workoutWithMeasureDto!.workout.name,
      ),
    );
  }
}
