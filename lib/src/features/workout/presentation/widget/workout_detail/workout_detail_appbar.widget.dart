import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/delete_workout/delete_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/edit_workout/edit_workout.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutDetailAppbarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const WorkoutDetailAppbarWidget({
    super.key,
    required this.workout,
  });

  final WorkoutDto workout;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() {
      ref.read(deleteWorkoutProvider.notifier).go(workout.id);
    }

    final editWorkoutStatus = ref.watch(editWorkoutProvider);
    final deleteWorkoutStatus = ref.watch(deleteWorkoutProvider);

    final isLoading = (editWorkoutStatus?.isLoading ?? false) ||
        (deleteWorkoutStatus?.isLoading ?? false);

    return AppBar(
      title: const Text("Workout"),
      actions: [
        IconButton(
          onPressed: isLoading ? null : onDelete,
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
