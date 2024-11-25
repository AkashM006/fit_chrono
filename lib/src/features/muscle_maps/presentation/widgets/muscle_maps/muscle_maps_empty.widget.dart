import 'package:fit_chrono/src/features/shared/presentation/widgets/empty_list/empty_list.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';

class MuscleMapsEmptyWidget extends StatelessWidget {
  const MuscleMapsEmptyWidget({
    super.key,
    this.hideButton = false,
  });

  final bool hideButton;

  @override
  Widget build(BuildContext context) {
    return EmptyListWidget(
      text:
          "Your journey starts here! 🏋️‍♂️💥 Add your first muscle map to crush those goals!",
      buttonText: "Add Muscle Map",
      targetPage: PAGES.muscleMapForm,
      hideButton: hideButton,
    );
  }
}
