import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/get_workout_wave/get_workout_wave.provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutWaveDetailScreen extends ConsumerWidget {
  const WorkoutWaveDetailScreen({
    super.key,
    required this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      return const Scaffold(
        body: Center(
          child: Text("Not Found!"),
        ),
      );
    }

    final workoutWaveWithWorkouts = ref.watch(getWorkoutWaveProvider(id!));

    return Scaffold(
        body: AsyncValueBuilderWidget(
      asyncValue: workoutWaveWithWorkouts,
      builder: (context, data) => Center(
        child: Text(
          "Workout Wave Name: ${data.workoutWave.name}",
        ),
      ),
    ));
  }
}
