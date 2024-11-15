import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/form_container/form_container.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/add_workout/add_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_description.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_form.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutFormScreen extends ConsumerWidget {
  const WorkoutFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      addWorkoutProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pushReplacement(PAGES.workoutForm.path);
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: FormContainerWidget(
        children: [
          const WorkoutDescriptionWidget(),
          SizedBox(
            height: SizeConfig.safeBlockVertical * 4,
          ),
          const WorkoutFormWidget(),
        ],
      ),
    );
  }
}
