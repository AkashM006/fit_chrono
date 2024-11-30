import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/workout_waves.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_waves/workout_wave_list.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutWavesScreen extends ConsumerWidget {
  const WorkoutWavesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workoutWaves = ref.watch(workoutWavesProvider);

    void onNewWorkoutWave() {
      context.push(PAGES.workoutWavesForm.path);
    }

    return Scaffold(
      appBar: CustomAsyncAppBar(
        asyncData: workoutWaves,
        builder: (context, data) => AppBar(
          title: const Text("Workout Waves"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onNewWorkoutWave,
        child: const Icon(Icons.add),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: workoutWaves,
        builder: (context, data) =>
            WorkoutWaveListWidget(workoutWavesWithWorkoutsMeasure: data),
      ),
    );
  }
}
