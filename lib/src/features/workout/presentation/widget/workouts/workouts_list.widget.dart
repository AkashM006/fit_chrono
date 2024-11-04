import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/workouts_empty.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

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

    void onWorkoutDetail(int id) {
      context.pushNamed(PAGES.workoutDetail.name, queryParameters: {
        'id': id.toString(),
      });
    }

    return ListView.builder(
        itemCount: workouts.length,
        itemBuilder: (context, index) {
          final workout = workouts[index];

          final muscles = workout.muscles
              .take(3)
              .map((muscle) => muscle.name)
              .toList()
              .join(', ');

          return ListTile(
            onTap: () => onWorkoutDetail(workout.id),
            title: Text(workout.name),
            subtitle: Text(
              muscles,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            trailing: const Icon(Icons.arrow_right),
          );
        });
  }
}
