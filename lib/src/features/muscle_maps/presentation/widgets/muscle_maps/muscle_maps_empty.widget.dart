import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuscleMapsEmptyWidget extends StatelessWidget {
  const MuscleMapsEmptyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    void onMuscleMapAdd() {
      context.push(PAGES.muscleMapForm.path);
    }

    return Center(
      child: ConstrainedBox(
        constraints: AppOffsets.messageWidthConstaint,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "You have no muscle maps",
              textAlign: TextAlign.center,
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(fontStyle: FontStyle.italic),
            ),
            TextButton(
              onPressed: onMuscleMapAdd,
              child: const Text(
                "Add Muscle Map",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
