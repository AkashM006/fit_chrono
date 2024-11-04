import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/muscle_maps.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_maps/muscle_maps_list.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_appbar/custom_appbar.widget.dart';
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
      appBar: CustomAppbarWidget(
        asyncData: muscleMaps,
        builder: (context, data) => AppBar(
          title: const Text("Muscle Maps"),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: onNewMuscleMapAdded,
        child: const Icon(Icons.add),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: muscleMaps,
        builder: (context, data) => MuscleMapsListWidget(muscleMaps: data),
      ),
    );
  }
}
