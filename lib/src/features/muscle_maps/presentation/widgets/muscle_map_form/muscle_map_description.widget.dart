import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class MuscleMapDescriptionWidget extends StatelessWidget {
  const MuscleMapDescriptionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Muscle Map",
          style: Theme.of(context).textTheme.displaySmall,
        ),
        SizedBox(
          height: SizeConfig.safeBlockVertical * 2,
        ),
        Text(
          'Define the muscle groups each exercise will push to the limit. Add the specific muscle your workout is designed to work on and make every rep count!',
          style: Theme.of(context).textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
