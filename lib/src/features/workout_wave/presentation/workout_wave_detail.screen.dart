import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/entity_not_found.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/form_container/form_container.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/stack_with_loader/stack_with_loader.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/delete_workout_wave/delete_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/edit_workout_wave/edit_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/get_workout_wave/get_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_detail/workout_wave_detail_appbar.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_form.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutWaveDetailScreen extends ConsumerWidget {
  const WorkoutWaveDetailScreen({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      void onNewWorkoutWave() =>
          context.pushReplacement(PAGES.workoutWavesForm.path);

      return EntityNotFoundScreen(
        title: "🌊",
        content:
            "Uh-oh! This Workout Wave seems to have drifted away. Ready to make a splash? Create a new wave and get moving!",
        actions: [
          OutlinedButton.icon(
            onPressed: onNewWorkoutWave,
            label: const Text("Add Workout Wave"),
            icon: const Icon(Icons.add),
          )
        ],
      );
    }

    final workoutWaveWithWorkouts = ref.watch(getWorkoutWaveProvider(id!));

    final editWorkoutWaveStatus = ref.watch(editWorkoutWaveProvider);
    final deleteWorkoutWaveStatus = ref.watch(deleteWorkoutWaveProvider);

    final isEditLoading = editWorkoutWaveStatus?.isLoading ?? false;
    final isDeleteLoading = deleteWorkoutWaveStatus?.isLoading ?? false;

    final isLoading = isEditLoading || isDeleteLoading;

    ref.listen(
      editWorkoutWaveProvider,
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

    ref.listen(
      deleteWorkoutWaveProvider,
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
          appBar: CustomAsyncAppBar(
            asyncData: workoutWaveWithWorkouts,
            builder: (context, data) =>
                WorkoutWaveDetailAppbarWidget(workoutWithWorkoutsMeasure: data),
          ),
          body: AsyncValueBuilderWidget(
            asyncValue: workoutWaveWithWorkouts,
            builder: (context, data) => FormContainerWidget(
              isScroll: false,
              children: [
                WorkoutWaveFormWidget(
                  workoutWaveWithWorkoutsMeasure: data,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
