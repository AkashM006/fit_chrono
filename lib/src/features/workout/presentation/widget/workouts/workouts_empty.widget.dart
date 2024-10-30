import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutsEmptyWidget extends StatelessWidget {
  const WorkoutsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onAddWorkout() {
      context.push(PAGES.workoutForm.path);
    }

    return Center(
      child: ConstrainedBox(
        constraints: AppOffsets.messageWidthConstaint,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Your workout space is all set - let's build it up",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            TextButton(
              onPressed: onAddWorkout,
              child: const Text("Add Workout"),
            ),
          ],
        ),
      ),
    );
  }
}
