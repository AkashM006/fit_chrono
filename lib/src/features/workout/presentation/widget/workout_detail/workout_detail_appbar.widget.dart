import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:flutter/material.dart';

class WorkoutDetailAppbarWidget extends StatelessWidget {
  const WorkoutDetailAppbarWidget({
    super.key,
    required this.workout,
  });

  final WorkoutDto workout;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: const Text("Workout"),
    );
  }
}
