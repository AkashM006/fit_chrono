import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_list_tile_with_actions/custom_list_tile_with_actions.widget.dart';
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

    void onWorkoutWaveStart(int id) {}

    final cardBorderRadius = AppOffsets.cardBorderRadius;

    return ListView.builder(
      itemCount: workoutWaves.length,
      itemBuilder: (context, index) {
        final workoutWave = workoutWaves[index];

        return Card(
          shape: RoundedRectangleBorder(
            borderRadius: cardBorderRadius,
          ),
          child: InkWell(
            borderRadius: cardBorderRadius,
            onTap: () => onWorkoutWaveTap(workoutWave.id),
            child: CustomListTileWithActionsWidget(
              body: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        workoutWave.name,
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const Icon(Icons.arrow_right),
                    ],
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text("12 Workouts"),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(
                        "\u2022",
                        style: Theme.of(context).textTheme.titleLarge,
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      const Text("NEW"),
                    ],
                  ),
                  const SizedBox(height: 5),
                ],
              ),
              actions: [
                TextButton.icon(
                  onPressed: () => onWorkoutWaveStart(workoutWave.id),
                  label: const Text("Let's Go"),
                  icon: const Icon(
                    Icons.play_arrow_rounded,
                  ),
                  style: TextButton.styleFrom(
                    padding: EdgeInsets.zero,
                    minimumSize: Size.zero,
                    tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
