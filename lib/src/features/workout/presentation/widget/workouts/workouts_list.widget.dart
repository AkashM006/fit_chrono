import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/workouts_empty.widget.dart';
import 'package:flutter/material.dart';

class WorkoutsListWidget extends StatelessWidget {
  const WorkoutsListWidget({
    super.key,
    required this.workouts,
  });

  final List<WorkoutDto> workouts;

  @override
  Widget build(BuildContext context) {
    if (workouts.isEmpty) {
      return const WorkoutsEmptyWidget();
    }

    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(workouts[index].name),
      ),
    );
  }
}
