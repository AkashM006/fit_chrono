import 'package:fit_chrono/src/features/shared/presentation/widgets/form_container/form_container.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/stack_with_loader/stack_with_loader.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_description.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_form.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutWaveFormScreen extends ConsumerWidget {
  const WorkoutWaveFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    const isLoading = false;

    return StackWithLoaderWidget(
      isLoading: isLoading,
      children: [
        Scaffold(
          appBar: AppBar(),
          body: const FormContainerWidget(
            isScroll: false,
            children: [
              WorkoutWaveDescriptionWidget(),
              SizedBox(
                height: 20,
              ),
              WorkoutWaveFormWidget(),
            ],
          ),
        ),
      ],
    );
  }
}
