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

  void onWaveComplete() {
    onNext();
  }

  void onExit() {}

  void onSkip() {
    onNext();
  }

  void onNext() {
    // if (_currentIndex < _pages.length - 1) {
    //   setState(() {
    //     _currentIndex += 1;
    //   });
    //   _pageController.nextPage(
    //     duration: const Duration(milliseconds: 150),
    //     curve: Curves.decelerate,
    //   );
    // } else {
    //   // todo: workout wave complete
    // }

    // implement this logic
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final workoutsWithMeasure =
        widget.workoutWaveWithWorkouts.workoutsWithMeasure;

    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemCount: workoutsWithMeasure.length + 1,
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
