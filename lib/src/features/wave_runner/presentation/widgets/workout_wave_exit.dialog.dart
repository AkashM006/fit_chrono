import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

Future<bool> showWorkoutWaveExitDialog(BuildContext context) async {
  final isQuitting = await showDialog<bool>(
      context: context,
      builder: (context) => const WorkoutWaveExitDialog(),
      barrierDismissible: false);

  return isQuitting ?? false;
}

class WorkoutWaveExitDialog extends StatelessWidget {
  const WorkoutWaveExitDialog({super.key});

  @override
  Widget build(BuildContext context) {
    // Note: When popping returning if the user decides to quit
    void onExit() {
      context.pop(true);
    }

    void onContinue() {
      context.pop(false);
    }

    return AlertDialog(
      title: const Text("Don't Stop Now!"),
      content: const Text(
          "You've already crushed half of your workout wave—why stop now? Every rep, every second brings you closer to your goal. Take a deep breath, dig deep, and finish strong! You’ve got this! 💪"),
      actions: [
        TextButton(onPressed: onExit, child: const Text("Quit Anyway")),
        TextButton(onPressed: onContinue, child: const Text("Keep Going 🔥")),
      ],
    );
  }
}
