import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/start_wave.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/wave.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:flutter/material.dart';

class WaveRunnerScreen extends StatefulWidget {
  const WaveRunnerScreen({
    super.key,
    required this.workoutWave,
  });

  final WorkoutWaveWithWorkoutsMeasureDto workoutWave;

  @override
  State<WaveRunnerScreen> createState() => _WaveRunnerScreenState();
}

class _WaveRunnerScreenState extends State<WaveRunnerScreen> {
  late List<Widget> _pages = [];
  final PageController _pageController = PageController();

  void onStartComplete() {}

  @override
  void initState() {
    super.initState();
    final startWidget = StartWaveWidget(
      onTimerComplete: onStartComplete,
      workoutWave: widget.workoutWave.workoutWave,
      nextWorkout: widget.workoutWave.workoutsWithMeasure[0],
    );

    final workouts = widget.workoutWave.workoutsWithMeasure
        .map(
          (workoutWithMeasure) => WaveWidget(
            workoutWithMeasureDto: workoutWithMeasure,
          ),
        )
        .toList();

    _pages = [startWidget, ...workouts];
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => _pages[index],
        itemCount: _pages.length,
      ),
    );
  }
}
