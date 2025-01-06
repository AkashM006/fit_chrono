import 'package:fit_chrono/src/features/shared/presentation/widgets/empty_list/empty_list.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';

class WorkoutWaveEmptywidget extends StatelessWidget {
  const WorkoutWaveEmptywidget({
    super.key,
    this.hideButton = false,
  });

  final bool hideButton;

  @override
  Widget build(BuildContext context) => EmptyListWidget(
        text:
            "🌊 No Workout Waves yet! Start surfing those workout waves and crush your goals!",
        buttonText: "Add Workout Wave",
        targetPage: PAGES.workoutWavesForm,
        hideButton: hideButton,
      );
}
