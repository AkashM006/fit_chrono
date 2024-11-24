import 'dart:async';

import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/search_workout/search_workout.provider.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class SearchableWorkoutListWidget extends ConsumerStatefulWidget {
  const SearchableWorkoutListWidget({super.key});

  @override
  ConsumerState<SearchableWorkoutListWidget> createState() =>
      _SearchableWorkoutListWidgetState();
}

class _SearchableWorkoutListWidgetState
    extends ConsumerState<SearchableWorkoutListWidget> {
  final Debouncer _debouncer = Debouncer(milliseconds: 500);
  String name = "";

  void onWorkoutSelect(WorkoutDto workout) {
    context.pop(workout);
  }

  void onSearch(String? newValue) {
    if (newValue == null) return;
    _debouncer.run(() {
      setState(() {
        name = newValue;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final workouts = ref.watch(searchWorkoutsProvider(name));

    void onAddWorkout() {
      context.push(PAGES.workoutForm.path);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Select a workout"),
      ),
      body: Padding(
        padding: AppOffsets.screenPadding,
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                hintText: "Search your workout",
                hintStyle: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: Theme.of(context).colorScheme.tertiary,
                    ),
              ),
              onChanged: onSearch,
            ),
            const SizedBox(
              height: 20,
            ),
            OutlinedButton.icon(
              onPressed: onAddWorkout,
              icon: const Icon(Icons.add),
              label: const Text("Add Workout"),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  AsyncValueBuilderWidget(
                    asyncValue: workouts,
                    isSliver: true,
                    builder: (context, data) => SliverList.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) => ListTile(
                        title: Text(data[index].name),
                        onTap: () => onWorkoutSelect(data[index]),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class Debouncer {
  final int milliseconds;
  VoidCallback? action;
  Timer? _timer;

  Debouncer({required this.milliseconds});

  void run(VoidCallback action) {
    _timer?.cancel(); // Cancel the previous timer if it's still active
    _timer =
        Timer(Duration(milliseconds: milliseconds), action); // Set a new timer
  }
}
