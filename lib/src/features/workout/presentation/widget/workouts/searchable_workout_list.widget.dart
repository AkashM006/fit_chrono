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
  String name = "";

  void onWorkoutSelect(WorkoutDto workout) {
    context.pop(workout);
  }

  void onSearch(String? newValue) {
    if (newValue == null) return;
    setState(() {
      name = newValue;
    });
  }

  @override
  Widget build(BuildContext context) {
    final workouts = ref.watch(searchWorkoutsProvider(name));

    void onAddWorkout() async {
      await context.push(PAGES.workoutForm.path);
      ref.invalidate(searchWorkoutsProvider);
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
