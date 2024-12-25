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
    required this.timeElapsed,
    this.nextWorkoutWithMeasureDto,
    required this.currentWorkout,
    required this.totalWorkouts,
  }) : isStart = false;

  const WaveWithCountWidget.start({
    super.key,
    required this.workoutWave,
    required this.onSkip,
    required this.onComplete,
    required this.nextWorkoutWithMeasureDto,
    required this.timeElapsed,
    required this.totalWorkouts,
  })  : workoutWithMeasureDto = null,
        isStart = true,
        currentWorkout = 0;

  final Duration timeElapsed;
  final WorkoutWithMeasureDto? workoutWithMeasureDto;
  final WorkoutWaveDto workoutWave;
  final void Function(Duration timeElapsed) onSkip;
  final void Function(Duration timeElapsed) onComplete;
  final WorkoutWithMeasureDto? nextWorkoutWithMeasureDto;
  final int currentWorkout;
  final int totalWorkouts;

  final bool isStart;

  @override
  State<WaveWithCountWidget> createState() => _WaveWithCountWidgetState();
}

class _WaveWithCountWidgetState extends State<WaveWithCountWidget> {
  // Timer properties to keep track of countdown if workout is timer based
  late Duration? _remainingTime;
  late Timer? _timer;
  late bool _isPaused;
  late bool _isTimeBased;

  // Timer properties to keep track of workout wave elapsed time
  Duration _elapsedTime = Duration.zero;
  late Timer? _elapsedTimeTimer;

  @override
  void initState() {
    super.initState();
    _isPaused = false;
    final currentWorkout = widget.workoutWithMeasureDto;

    resumeElapsedTimer();

    _isTimeBased =
        widget.isStart || widget.workoutWithMeasureDto!.workoutMeasure.isTime;

    if (_isTimeBased) {
      _remainingTime = widget.isStart
          ? const Duration(seconds: 15)
          : Duration(seconds: currentWorkout!.count);
      resumeCountDownTimer();
      return;
    }
    _remainingTime = Duration.zero;
    _timer = null;
  }

  @override
  void dispose() {
    super.dispose();
    _timer?.cancel();
    _elapsedTimeTimer?.cancel();
  }

  void resumeCountDownTimer() {
    if (!_isTimeBased) return;
    setState(() {
      _isPaused = false;
    });
    _timer = Timer.periodic(
      oneSecond,
      (timer) {
        if (_remainingTime!.inSeconds > 0) {
          setState(() {
            _remainingTime = _remainingTime! - oneSecond;
          });
        } else {
          stopCountDownTimer();
          stopElapsedTimer();
          widget.onComplete(_elapsedTime);
        }
      },
    );
  }

  void stopCountDownTimer() {
    setState(() {
      _isPaused = true;
    });
    _timer?.cancel();
  }

  void resumeElapsedTimer() {
    if (widget.isStart) {
      _elapsedTimeTimer = null;
      return;
    }
    _elapsedTimeTimer = Timer.periodic(
      oneSecond,
      (timer) {
        if (!mounted) return;
        if (_isTimeBased &&
            _remainingTime != null &&
            _remainingTime!.inSeconds == 0) {
          stopElapsedTimer();
          return;
        }
        setState(() {
          _elapsedTime += oneSecond;
        });
      },
    );
  }

  void stopElapsedTimer() {
    _elapsedTimeTimer?.cancel();
  }

  void onExit() async {
    stopElapsedTimer();
    if (_isTimeBased) {
      stopCountDownTimer();
    }

    final isQuitting = await showWorkoutWaveExitDialog(context);
    if (!isQuitting) {
      if (_isTimeBased) resumeCountDownTimer();
      resumeElapsedTimer();
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

  void onWaveResume() {
    if (_isTimeBased) resumeCountDownTimer();
    resumeElapsedTimer();
  }

  void onWavePause() {
    if (_isTimeBased) stopCountDownTimer();
    stopElapsedTimer();
  }

  @override
  Widget build(BuildContext context) {
    void onPopInvokedWithResult(didPop, result) {
      if (didPop) return;
      onExit();
    }

    final nextWorkout = widget.nextWorkoutWithMeasureDto;
    final workoutWaveName = widget.workoutWave.name;

    final progressPercentage =
        (widget.currentWorkout / widget.totalWorkouts) * 100;

    final progressText = switch (progressPercentage) {
      <= 34 => "Getting Started!",
      <= 67 => "Keep Going!",
      _ => "Almost there!"
    };

    final List<String> progressList = [];

    final currentWorkout = widget.workoutWithMeasureDto;

    if (currentWorkout != null && currentWorkout.workout.isRest) {
      progressList.add("✅ ${widget.currentWorkout - 1} Down");
      progressList
          .add("⏳ ${widget.totalWorkouts - widget.currentWorkout + 1} To Go");
    } else {
      progressList.add(
          "🏋️‍♂️ ${widget.currentWorkout} / ${widget.totalWorkouts} | $progressText");
    }

    final String? nextWorkoutName =
        widget.nextWorkoutWithMeasureDto?.workout.name;
    String? nextWorkoutCount;

    if (nextWorkout != null) {
      if (nextWorkout.workoutMeasure.isTime) {
        nextWorkoutCount =
            getFormattedTime(Duration(seconds: nextWorkout.count));
      } else {
        nextWorkoutCount = '${nextWorkout.count}x';
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
          onTimerPause: onWavePause,
          onTimerResume: onWaveResume,
          onExit: onExit,
          onSkip: () => widget.onSkip(_elapsedTime),
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

    if (_isTimeBased) {
      return PopScope(
        canPop: false,
        onPopInvokedWithResult: onPopInvokedWithResult,
        child: WaveWidget.time(
          workoutWaveName: workoutWaveName,
          actionTitle: actionTitle,
          workoutTitle: workoutTitle,
          beTitle: beTitle,
          duration: _remainingTime,
          isPaused: _isPaused,
          onTimerPause: onWavePause,
          onTimerResume: onWaveResume,
          onSkip: () => widget.onSkip(_elapsedTime),
          onExit: onExit,
          nextWorkoutName: nextWorkoutName,
          nextWorkoutCount: nextWorkoutCount,
          showTimeAddition: isRest,
          onAddTime: onAddTenSeconds,
          elapsedTime: _elapsedTime + widget.timeElapsed,
          progressList: progressList,
        ),
      );
    }

    final reps = widget.workoutWithMeasureDto!.count;

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: onPopInvokedWithResult,
      child: WaveWidget.reps(
        workoutWaveName: workoutWaveName,
        actionTitle: actionTitle,
        workoutTitle: workoutTitle,
        beTitle: beTitle,
        reps: reps,
        onSkip: () => widget.onSkip(_elapsedTime),
        onExit: onExit,
        nextWorkoutName: nextWorkoutName,
        nextWorkoutCount: nextWorkoutCount,
        onDone: () => widget.onComplete(_elapsedTime),
        elapsedTime: _elapsedTime + widget.timeElapsed,
        progressList: progressList,
      ),
    );
  }
}
