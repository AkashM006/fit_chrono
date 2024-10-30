import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class WorkoutDescriptionWidget extends StatelessWidget {
  const WorkoutDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Workout",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 2,
        ),
        Text(
          'Time to bring the heat! You can add this to a workout wave later and power through it in your wave',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
