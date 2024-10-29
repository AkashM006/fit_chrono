import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_appbar/custom_appbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/workouts.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/workouts_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutsScreen extends ConsumerWidget {
  const WorkoutsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final workouts = ref.watch(workoutsProvider);

    return Scaffold(
      appBar: CustomAppbarWidget(
        asyncData: workouts,
        builder: (context, data) => AppBar(
          title: const Text("Workouts"),
        ),
      ),
      body: workouts.when(
        data: (data) => WorkoutsListWidget(
          workouts: data,
        ),
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
