import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/form_container/form_container.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/stack_with_loader/stack_with_loader.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/add_workout_wave/add_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_description.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutWaveFormScreen extends ConsumerWidget {
  const WorkoutWaveFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final addWorkoutWaveStatus = ref.watch(addWorkoutWaveProvider);
    final addWorkoutWaveLoading = addWorkoutWaveStatus?.isLoading ?? false;

    final isLoading = addWorkoutWaveLoading;

    ref.listen(
      addWorkoutWaveProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    return StackWithLoaderWidget(
      isLoading: isLoading,
      children: [
        Scaffold(
          resizeToAvoidBottomInset: true,
          appBar: AppBar(),
          body: const FormContainerWidget(
            isScroll: false,
            children: [
              WorkoutWaveDescriptionWidget(),
              SizedBox(
                height: 20,
              ),
              WorkoutWaveFormWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
