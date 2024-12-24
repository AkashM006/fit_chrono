import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/dto/wave_runner_log.dto.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/provider/wave_runner_log/wave_runner_log.provider.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave_complete.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave_with_count.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WaveRunnerScreen extends ConsumerStatefulWidget {
  const WaveRunnerScreen({
    super.key,
    required this.workoutWaveWithWorkouts,
  });

  final WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkouts;

  @override
  ConsumerState<WaveRunnerScreen> createState() => _WaveRunnerScreenState();
}

class _WaveRunnerScreenState extends ConsumerState<WaveRunnerScreen> {
  final PageController _pageController = PageController();
  late final int _pagesLength;
  Duration _totalTimeElapsed = Duration.zero;
  late final int _totalWorkouts;
  int _currentWorkout = 1;
  int _currentIndex = 0;
  WaveRunnerLogDto _log = WaveRunnerLogDto.init();

  @override
  void initState() {
    super.initState();
    _pagesLength =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure.length + 2;
    _totalWorkouts = widget.workoutWaveWithWorkouts.workoutsWithMeasure.fold(
      0,
      (value, workoutWithMeasure) =>
          value + (workoutWithMeasure.workout.isRest ? 0 : 1),
    );
  }

  bool get isCompletePage => _currentIndex == _pagesLength - 1;

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onWaveComplete(Duration timeElapsed) {
    _onNext(timeElapsed);
  }

  void onSkip(Duration timeElapsed) {
    _onNext(timeElapsed);
  }

  void _onNext(Duration timeElapsed) {
    _totalTimeElapsed += timeElapsed;
    _currentIndex += 1;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    if (isCompletePage) {
      final log = WaveRunnerLogDto.init().copyWith(
        workoutWaveWithWorkoutsMeasure: widget.workoutWaveWithWorkouts,
      );
      _log = log;
      ref.read(waveRunnerLogProvider.notifier).go(log);
      return;
    }
    final workoutsWithMeasure =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure;

    if (_currentIndex < workoutsWithMeasure.length &&
        !workoutsWithMeasure[_currentIndex].workout.isRest) {
      _currentWorkout += 1;
    }
  }

  @override
  Widget build(BuildContext context) {
    final workoutsWithMeasure =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure;

    ref.listen(
      waveRunnerLogProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    return SafeArea(
      child: Scaffold(
        body: PageView.builder(
          controller: _pageController,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: _pagesLength,
          itemBuilder: (context, index) {
            if (index == 0) {
              return WaveWithCountWidget.start(
                workoutWave: widget.workoutWaveWithWorkouts.workoutWave,
                onSkip: onSkip,
                onComplete: onWaveComplete,
                nextWorkoutWithMeasureDto: workoutsWithMeasure[0],
                timeElapsed: _totalTimeElapsed,
                totalWorkouts: _totalWorkouts,
              );
            }

            final isLastWorkout = index ==
                _pagesLength -
                    2; // in order to account for the last item which is actually complete screen
            final isLastScreen = index == _pagesLength - 1;

            if (isLastScreen) {
              return WaveCompleteWidget(
                timeTaken: _totalTimeElapsed,
                workoutsCompleted: _totalWorkouts,
                log: _log,
              );
            }

            return WaveWithCountWidget(
              key: ValueKey(
                workoutsWithMeasure[index - 1].uniqueId,
              ), // index - 1 is to account for the start screen added in the first
              workoutWithMeasureDto: workoutsWithMeasure[index - 1],
              workoutWave: widget.workoutWaveWithWorkouts.workoutWave,
              onSkip: onSkip,
              onComplete: onWaveComplete,
              nextWorkoutWithMeasureDto:
                  !isLastWorkout ? workoutsWithMeasure[index] : null,
              timeElapsed: _totalTimeElapsed,
              currentWorkout: _currentWorkout,
              totalWorkouts: _totalWorkouts,
            );
          },
        ),
      ),
    );
  }
}
