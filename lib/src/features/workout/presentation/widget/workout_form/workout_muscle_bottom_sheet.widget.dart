import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/muscle_maps.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_maps/muscle_maps_empty.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutMuscleBottomSheetWidget extends ConsumerWidget {
  const WorkoutMuscleBottomSheetWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muscles = ref.watch(muscleMapsProvider);

    return muscles.when(
      data: (data) {
        if (data.isEmpty) {
          return const MuscleMapsEmptyWidget();
        }

        return const Text("Hello");
      },
      error: (error, stackTrace) => CustomErrorWidget(text: error.toString()),
      loading: () => const LoaderWidget(
        text: "Loading muscle maps",
      ),
    );
  }
}
