import 'package:fit_chrono/src/features/shared/presentation/widgets/confirm_dialog/confirm_dialog.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_detail/workout_detail_appbar.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/delete_workout_wave/delete_workout_wave.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<bool?> showConfirmDeleteWorkoutWaveDialog(BuildContext context) async {
  final canDelete = await showDialog<bool?>(
    context: context,
    builder: (context) => const ConfirmDialogWidget(
      title: "Delete Workout Wave?",
      content:
          "Are you sure you want to delete this Workout Wave? 🌊 All associated workouts will remain, but this wave will be gone for good. This action cannot be undone.",
    ),
  );

  return canDelete;
}

class WorkoutWaveDetailAppbarWidget extends ConsumerWidget
    implements PreferredSizeWidget {
  const WorkoutWaveDetailAppbarWidget({
    super.key,
    required this.workoutWithWorkoutsMeasure,
  });

  final WorkoutWaveWithWorkoutsMeasureDto workoutWithWorkoutsMeasure;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDelete() async {
      final canDelete = await showConfirmDeleteWorkoutDialog(context);

      if (canDelete == null || !canDelete) return;

      ref
          .read(deleteWorkoutWaveProvider.notifier)
          .go(workoutWithWorkoutsMeasure.workoutWave.id);
    }

    return AppBar(
      title: Text(
        workoutWithWorkoutsMeasure.workoutWave.name,
        overflow: TextOverflow.ellipsis,
      ),
      actions: [
        IconButton(
          onPressed: onDelete,
          icon: const Icon(Icons.delete),
          color: Theme.of(context).colorScheme.error,
        ),
      ],
    );
  }
}
