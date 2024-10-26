import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/muscle_maps.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_maps/muscle_maps_list.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MuscleMapScreen extends ConsumerWidget {
  const MuscleMapScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muscleMaps = ref.watch(muscleMapsProvider);

    void onNewMuscleMapAdded() {
      context.push(PAGES.muscleMapForm.path);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Muscle Maps"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onNewMuscleMapAdded,
        child: const Icon(Icons.add),
      ),
      body: muscleMaps.when(
        data: (data) => MuscleMapsListWidget(muscleMaps: data),
        error: (error, stackTrace) => Center(
          child: CustomErrorWidget(text: error.toString()),
        ),
        loading: () => const Center(
          child: LoaderWidget(),
        ),
      ),
    );
  }
}
