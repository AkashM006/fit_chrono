import 'package:fit_chrono/src/features/shared/presentation/widgets/form_description/description.widget.dart';
import 'package:flutter/material.dart';

class WorkoutDescriptionWidget extends StatelessWidget {
  const WorkoutDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DescriptionWidget(
      title: "Workout",
      subtitle:
          "Time to bring the heat! You can add this to a workout wave later and power through it in your wave",
    );
  }
}
