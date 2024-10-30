import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_description.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_form.widget.dart';
import 'package:flutter/material.dart';

class WorkoutFormScreen extends StatelessWidget {
  const WorkoutFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: AppOffsets.screenPadding,
        child: ConstrainedBox(
          constraints: AppOffsets.formWidthConstraint,
          child: Column(
            children: [
              const WorkoutDescriptionWidget(),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              const WorkoutFormWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
