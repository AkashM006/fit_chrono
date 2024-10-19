import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_form.widget.dart';
import 'package:flutter/material.dart';

class MuscleMapFormScreen extends StatelessWidget {
  const MuscleMapFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 5,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
          child: Column(
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
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              const MuscleMapFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
