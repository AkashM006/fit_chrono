import 'package:fit_chrono/src/features/shared/presentation/widgets/form_description/description.widget.dart';
import 'package:flutter/material.dart';

class MuscleMapDescriptionWidget extends StatelessWidget {
  const MuscleMapDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const DescriptionWidget(
      title: "Muscle Map",
      subtitle:
          "Define the muscle groups each exercise will push to the limit. Add the specific muscle your workout is designed to work on and make every rep count!",
    );
  }
}
