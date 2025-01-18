import 'package:fit_chrono/src/features/logs/presentation/provider/log.provider.dart';
import 'package:fit_chrono/src/features/shared/presentation/entity_not_found.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:fit_chrono/src/features/wave_runner/presentation/widgets/log_detail.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class LogDetailScreen extends ConsumerWidget {
  const LogDetailScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    if (id == null) {
      void onWaveRedirect() {
        context.pushReplacement(PAGES.workoutWaves.path);
      }

      return EntityNotFoundScreen(
        title: "📝",
        content:
            "Looks like this workout log has wandered off. 🕵️‍♂️ Don't worry, your journey's progress is still strong! 💪 Keep riding the waves and making strides! 🌊",
        actions: [
          OutlinedButton(
            onPressed: onWaveRedirect,
            child: const Text("Start a Wave"),
          ),
        ],
      );
    }

    final log = ref.watch(logProvider(id!));

    return Scaffold(
      appBar: CustomAsyncAppBar(
        asyncData: log,
        builder: (context, data) => AppBar(
          title: Text(
            '${data.workoutWaveWithWorkoutsMeasure.workoutWave.name} Log',
          ),
        ),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: log,
        builder: (context, data) => SingleChildScrollView(
          padding: const EdgeInsets.all(20),
          child: LogDetailWidget(log: data),
        ),
      ),
    );
  }
}
