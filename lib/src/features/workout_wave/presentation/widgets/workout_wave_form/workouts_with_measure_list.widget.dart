import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_form_dialog.widget.dart';
import 'package:flutter/material.dart';

class WorkoutsWithMeasureListWidget extends StatelessWidget {
  const WorkoutsWithMeasureListWidget({
    super.key,
    required this.workoutsWithMeasure,
    required this.workoutWaveName,
    required this.onWorkoutMeasureAdd,
    required this.onAddedWorkoutWithMeasureEdit,
    required this.onAddedWorkoutWithMeasureRemove,
  });

  final List<WorkoutWithMeasureDto> workoutsWithMeasure;
  final String workoutWaveName;
  final void Function(WorkoutWithMeasureDto workoutWithMeasure)
      onWorkoutMeasureAdd;
  final void Function(int index, WorkoutWithMeasureDto workoutWithMeasure)
      onAddedWorkoutWithMeasureEdit;
  final void Function(int index) onAddedWorkoutWithMeasureRemove;

  @override
  Widget build(BuildContext context) {
    void onNewWorkoutWithMeasure() {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => WorkoutFormDialogWidget(
          onWorkoutMeasureAdd: onWorkoutMeasureAdd,
        ),
      );
    }

    void onEditWorkoutWithMeasure(
      int index,
      WorkoutWithMeasureDto workoutWithMeasure,
    ) {
      showModalBottomSheet(
        context: context,
        isScrollControlled: true,
        builder: (context) => WorkoutFormDialogWidget(
          onWorkoutMeasureAdd: (workoutWithMeasure) =>
              onAddedWorkoutWithMeasureEdit(index, workoutWithMeasure),
          workoutWithMeasure: workoutWithMeasure,
        ),
      );
    }

    final listWidgets =
        workoutsWithMeasure.asMap().entries.map((workoutWithMeasureEntry) {
      final workoutWithMeasure = workoutWithMeasureEntry.value;
      final index = workoutWithMeasureEntry.key;
      final workoutCount =
          '${workoutWithMeasure.count}${workoutWithMeasure.workoutMeasure == WorkoutMeasureDto.time ? 's' : 'x'}';
      return ListTile(
        title: Text(workoutWithMeasure.workout.name),
        subtitle: Text(workoutCount),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              onPressed: () => onEditWorkoutWithMeasure(
                index,
                workoutWithMeasure,
              ),
              icon: const Icon(Icons.edit),
              color: Theme.of(context).colorScheme.onPrimaryFixedVariant,
            ),
            IconButton(
              onPressed: () => onAddedWorkoutWithMeasureRemove(index),
              icon: const Icon(Icons.delete),
              color: Theme.of(context).colorScheme.error,
            ),
          ],
        ),
      );
    }).toList();

    return Expanded(
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Workouts",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              TextButton.icon(
                onPressed: onNewWorkoutWithMeasure,
                icon: const Icon(Icons.add),
                label: const Text("Add Workout"),
              ),
            ],
          ),
          const Divider(
            height: 0.5,
          ),
          const SizedBox(
            height: 10,
          ),
          if (workoutsWithMeasure.isEmpty)
            Expanded(
              child: Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Text(
                    "It looks empty here! 🏋️ Add a workout to fill it up!",
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ),
              ),
            ),
          if (workoutsWithMeasure.isNotEmpty)
            Expanded(
              child: SingleChildScrollView(
                child: Column(children: listWidgets),
              ),
            ),
        ],
      ),
    );
  }
}
