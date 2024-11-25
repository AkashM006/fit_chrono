import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/search_workout/search_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/workouts_empty.widget.dart';
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
      final workout = WorkoutDto.init().copyWith(
        name: name,
      );
      await context.pushNamed(PAGES.workoutForm.name, extra: workout);
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
              keyboardType: TextInputType.text,
              textCapitalization: TextCapitalization.words,
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
                    builder: (context, data) => ResultListWidget(
                      workouts: data,
                      search: name,
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

class ResultListWidget extends StatelessWidget {
  const ResultListWidget({
    super.key,
    required this.workouts,
    required this.search,
  });

  final List<WorkoutDto> workouts;
  final String search;

  @override
  Widget build(BuildContext context) {
    void onWorkoutSelect(WorkoutDto workout) {
      context.pop(workout);
    }

    if (workouts.isEmpty && search.trim() == "") {
      return const SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              WorkoutsEmptyWidget(
                hideButton: true,
              ),
            ],
          ),
        ),
      );
    }

    if (workouts.isEmpty) {
      return SliverToBoxAdapter(
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ConstrainedBox(
                constraints: AppOffsets.messageWidthConstaint,
                child: Text(
                  "🏋️ No workouts matched your search! Time to refine your moves or create something new to crush your goals! 💪",
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
              ),
            ],
          ),
        ),
      );
    }

    return SliverList.builder(
      itemCount: workouts.length,
      itemBuilder: (context, index) => ListTile(
        title: Text(workouts[index].name),
        onTap: () => onWorkoutSelect(workouts[index]),
      ),
    );
  }
}
