import 'package:fit_chrono/src/features/shared/presentation/widgets/empty_list/empty_list.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';

class WorkoutsEmptyWidget extends StatelessWidget {
  const WorkoutsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const EmptyListWidget(
      text:
          "Your fitness journey is waiting to be written! 💥 Add some workouts and make them count!",
      buttonText: "Add Workout",
      targetPage: PAGES.workoutForm,
    );
  }
}
