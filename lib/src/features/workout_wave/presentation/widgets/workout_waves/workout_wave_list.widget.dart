import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_waves/workout_wave_empty.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class WorkoutWaveListWidget extends StatelessWidget {
  const WorkoutWaveListWidget({
    super.key,
    required this.workoutWaves,
  });

  final List<WorkoutWaveDto> workoutWaves;

  @override
  Widget build(BuildContext context) {
    if (workoutWaves.isEmpty) {
      return const WorkoutWaveEmptywidget();
    }

    void onWorkoutWaveTap(int id) {
      context.pushNamed(PAGES.workoutWaveDetail.name, queryParameters: {
        'id': id.toString(),
      });
    }

    return ListView.builder(
      itemCount: workoutWaves.length,
      itemBuilder: (context, index) {
        final workoutWave = workoutWaves[index];

        return ListTile(
          title: Text(workoutWave.name),
          trailing: const Icon(Icons.arrow_right),
          onTap: () => onWorkoutWaveTap(workoutWave.id),
        );
      },
    );
  }
}
