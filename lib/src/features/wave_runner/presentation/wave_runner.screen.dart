import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave_complete.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave_with_count.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';

class WaveRunnerScreen extends StatefulWidget {
  const WaveRunnerScreen({
    super.key,
    required this.workoutWaveWithWorkouts,
  });

  final WorkoutWaveWithWorkoutsMeasureDto workoutWaveWithWorkouts;

  @override
  State<WaveRunnerScreen> createState() => _WaveRunnerScreenState();
}

class _WaveRunnerScreenState extends State<WaveRunnerScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;
  late final int _pagesLength;
  Duration _totalTimeElapsed = Duration.zero;

  @override
  void initState() {
    super.initState();
    _pagesLength =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure.length + 2;
  }

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
    if (_currentPage >= _pagesLength - 1) {
      // todo: complete workout wave
      return;
    }

    _currentPage += 1;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
    _totalTimeElapsed += timeElapsed;
  }

  @override
  Widget build(BuildContext context) {
    final workoutsWithMeasure =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure;

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
              );
            }

            final isLastWorkout = index ==
                _pagesLength -
                    2; // in order to account for the last item which is actually complete screen
            final isLastScreen = index == _pagesLength - 1;

            if (isLastScreen) {
              return WaveCompleteWidget();
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
            );
          },
        ),
      ),
    );
  }
}
