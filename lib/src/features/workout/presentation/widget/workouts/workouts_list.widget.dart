import 'package:fit_chrono/src/features/shared/presentation/widgets/empty_list/empty_list.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
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
      return const Center(
        child: EmptyListWidget(
          text:
              "Your workout space is all set—let's build it up! Start adding your workouts now!",
        ),
      );
    }

    return ListView.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(workouts[index].name),
      ),
    );
  }
}
