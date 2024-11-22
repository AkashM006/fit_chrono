import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/delete_workout_wave/delete_workout_wave.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    void onDelete() {
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
