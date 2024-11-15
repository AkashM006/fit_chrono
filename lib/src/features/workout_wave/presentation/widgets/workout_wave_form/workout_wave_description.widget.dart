import 'package:fit_chrono/src/features/shared/presentation/widgets/form_description/description.widget.dart';
import 'package:flutter/material.dart';

class WorkoutWaveDescriptionWidget extends StatelessWidget {
  const WorkoutWaveDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DescriptionWidget(
      title: 'Workout Wave',
      subtitle:
          'Build your workout wave by adding multiple workouts. Set your reps and timing, and get ready to train like never before!',
    );
  }
}
