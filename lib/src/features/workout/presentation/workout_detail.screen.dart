import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/entity_not_found.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/delete_workout/delete_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/get_workout/get_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/edit_workout/edit_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_detail/workout_detail_appbar.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_form.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutDetailScreen extends ConsumerWidget {
  const WorkoutDetailScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      void onAddWorkout() {
        context.pushReplacement(PAGES.workoutForm.path);
      }

      return EntityNotFoundScreen(
        title: "🏋️",
        content:
            "Workout lost in action! 😅💨 Can't find it, but why not create a new one?",
        actions: [
          OutlinedButton.icon(
            onPressed: onAddWorkout,
            label: const Text("Add Workout"),
            icon: const Icon(Icons.add),
          )
        ],
      );
    }

    final workout = ref.watch(getWorkoutProvider(id!));

    ref.listen(
      editWorkoutProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) => showSnackBar(
            context,
            error.toString(),
          ),
        );
      },
    );

    ref.listen(
      deleteWorkoutProvider,
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

    return Scaffold(
      appBar: CustomAsyncAppBar(
        asyncData: workout,
        builder: (context, data) => WorkoutDetailAppbarWidget(
          workout: data,
        ),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: workout,
        builder: (context, data) => SingleChildScrollView(
          padding: AppOffsets.screenPadding,
          child: WorkoutFormWidget(
            workout: data,
          ),
        ),
      ),
    );
  }
}
