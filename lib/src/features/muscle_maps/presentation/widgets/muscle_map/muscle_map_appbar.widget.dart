import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/delete_muscle_map/delete_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/update_muscle_map/update_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/confirm_dialog/confirm_dialog.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<bool?> showConfirmMuscleMapDeleteDialog(context) async {
  final canDelete = await showDialog<bool>(
    context: context,
    builder: (context) => const ConfirmDialogWidget(
      title: 'Delete Muscle Map?',
      content:
          "Heads up! Removing this muscle will break its link to any workouts that target it. Your workouts will stay, but they’ll no longer be connected to this muscle. Ready to go ahead?",
    ),
  );

  return canDelete;
}

class MuscleMapAppbarWidget extends ConsumerWidget {
  const MuscleMapAppbarWidget({
    super.key,
    required this.muscleMap,
  });

  final MuscleMapDto muscleMap;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void handleDelete(int id) async {
      final canDelete = await showConfirmMuscleMapDeleteDialog(context);

      if (canDelete == null || !canDelete) return;

      ref.read(deleteMuscleMapProvider.notifier).go(id);
    }

    final updateMuscleMapStatus = ref.watch(updateMuscleMapProvider);
    final deleteMuscleMapStatus = ref.watch(deleteMuscleMapProvider);

    final isLoading = updateMuscleMapStatus is DataLoading ||
        deleteMuscleMapStatus is DataLoading;

    return AppBar(
      title: const Text("Muscle Map"),
      actions: [
        IconButton(
          onPressed: isLoading ? null : () => handleDelete(muscleMap.id),
          icon: const Icon(
            Icons.delete,
          ),
          color: Theme.of(context).colorScheme.error,
        )
      ],
    );
  }
}
