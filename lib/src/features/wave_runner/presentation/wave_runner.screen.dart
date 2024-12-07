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
  late final int pagesLength;

  @override
  void initState() {
    super.initState();
    pagesLength = widget.workoutWaveWithWorkouts.workoutsWithMeasure.length + 1;
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  void onWaveComplete() {
    onNext();
  }

  void onExit() {}

  void onSkip() {
    onNext();
  }

  void onNext() {
    if (_currentPage >= pagesLength - 1) {
      // todo: complete workout wave
      return;
    }

    _currentPage += 1;
    _pageController.nextPage(
      duration: const Duration(milliseconds: 250),
      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    final workoutsWithMeasure =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure;

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: pagesLength,
        itemBuilder: (context, index) {
          if (index == 0) {
            return WaveWithCountWidget.start(
              workoutWave: widget.workoutWaveWithWorkouts.workoutWave,
              onSkip: onSkip,
              onComplete: onWaveComplete,
            );
          }

          return WaveWithCountWidget(
            key: ValueKey(workoutsWithMeasure[index - 1].uniqueId),
            workoutWithMeasureDto: workoutsWithMeasure[index - 1],
            workoutWave: widget.workoutWaveWithWorkouts.workoutWave,
            onSkip: onSkip,
            onComplete: onWaveComplete,
          );
        },
      ),
    );
  }
}
