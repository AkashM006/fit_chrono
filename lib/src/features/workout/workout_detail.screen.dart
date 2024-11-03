import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutDetailScreen extends ConsumerWidget {
  const WorkoutDetailScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final messageConstraints = AppOffsets.messageWidthConstaint;

    if (id == null) {
      return Scaffold(
        appBar: AppBar(
          title: const Text("Not Found"),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: messageConstraints,
            child: Text(
              "Workout lost in action! 😅💨 Can't find it, but why not create a new one?",
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ),
        ),
      );
    }

    return const Scaffold(
      body: Center(
        child: Text("Detail"),
      ),
    );
  }
}
