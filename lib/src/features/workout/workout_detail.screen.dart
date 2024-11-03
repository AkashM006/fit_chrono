import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_appbar/custom_appbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/get_workout/get_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/update_workout/update_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_detail/workout_detail_appbar.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_form.widget.dart';
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
    final messageConstraints = AppOffsets.messageWidthConstaint;

    if (id == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Not Found"),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: messageConstraints,
            child: Text(
              "Workout lost in action! 😅💨 Can't find it, but why not create a new one?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      );
    }

    final workout = ref.watch(getWorkoutProvider(id!));

    ref.listen(
      updateWorkoutProvider,
      (previous, next) {
        next?.fold(
          onSuccess: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          onFailure: (error) => showSnackBar(
            context,
            error.toString(),
          ),
        );
      },
    );

    return Scaffold(
      appBar: CustomAppbarWidget(
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
