import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_form_dialog.widget.dart';
import 'package:flutter/material.dart';

class WorkoutsWithMeasureListWidget extends StatelessWidget {
  const WorkoutsWithMeasureListWidget({
    super.key,
    required this.workoutsWithMeasure,
    required this.workoutWaveName,
    required this.onWorkoutMeasureAdd,
  });

  final List<WorkoutWithMeasureDto> workoutsWithMeasure;
  final String workoutWaveName;
  final void Function(WorkoutWithMeasureDto workoutWithMeasure)
      onWorkoutMeasureAdd;

  @override
  Widget build(BuildContext context) {
    void onNewWorkoutWithMeasure() {
      showModalBottomSheet(
        context: context,
        builder: (context) => WorkoutFormDialogWidget(
          onWorkoutMeasureAdd: onWorkoutMeasureAdd,
        ),
      );
    }

    final listWidgets = workoutsWithMeasure
        .map((workoutWithMeasure) => ListTile(
              title: Text(workoutWithMeasure.workout.name),
            ))
        .toList();

    return Column(
      children: [
        Align(
          alignment: Alignment.centerLeft,
          child: Text(
            "Workouts in your wave",
            style: Theme.of(context).textTheme.titleMedium,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        const Divider(
          height: 0.5,
        ),
        const SizedBox(
          height: 10,
        ),
        TextButton.icon(
          onPressed: onNewWorkoutWithMeasure,
          icon: const Icon(Icons.add),
          label: const Text("Add Workout"),
        ),
        const SizedBox(
          height: 10,
        ),
        if (workoutsWithMeasure.isEmpty)
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text(
              "It looks empty here! 🏋️ Add a workout to fill it up!",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        if (workoutsWithMeasure.isNotEmpty) ...listWidgets,
      ],
    );
  }
}
