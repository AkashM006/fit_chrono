import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/form_container/form_container.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/stack_with_loader/stack_with_loader.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/add_workout/add_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_description.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    final isAddLoading = ref.watch(addWorkoutProvider)?.isLoading ?? false;

    return StackWithLoaderWidget(
      isLoading: isAddLoading,
      children: [
        Scaffold(
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
        ),
      ],
    );
  }
}
