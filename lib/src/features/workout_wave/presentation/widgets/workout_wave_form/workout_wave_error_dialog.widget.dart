import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutWaveErrorDialogWidget extends StatelessWidget {
  const WorkoutWaveErrorDialogWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onClose() {
      context.pop();
    }

    return AlertDialog(
      title: const Text("Hold Up! Your Wave Needs Workouts! 💪"),
      content: const Text(
        "You're about to create a workout wave, but it's missing the key ingredient—workouts! Add one or more workouts to make your wave unstoppable 🏋️‍♂️",
      ),
      actions: [TextButton(onPressed: onClose, child: const Text("Got it!"))],
    );
  }
}
