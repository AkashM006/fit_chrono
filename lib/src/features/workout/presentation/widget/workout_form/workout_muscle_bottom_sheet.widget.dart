import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/muscle_maps.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_maps/muscle_maps_empty.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutMuscleBottomSheetWidget extends ConsumerWidget {
  const WorkoutMuscleBottomSheetWidget({
    super.key,
    required this.selectedMusclesIdList,
    required this.onMuscleMapSelect,
  });

  final List<int> selectedMusclesIdList;
  final void Function(MuscleMapDto? muscle) onMuscleMapSelect;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final muscles = ref.watch(muscleMapsProvider);

    void onMuscleStatusChanged(
      MuscleMapDto muscle,
      bool? selected,
    ) {
      if (selected == null) return;
    }

    return muscles.when(
      data: (data) {
        if (data.isEmpty) {
          return const MuscleMapsEmptyWidget();
        }

        return Column(
          children: [
            Text(
              "Select Muscle Maps",
              textAlign: TextAlign.left,
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) => CheckboxListTile(
                  value: selectedMusclesIdList.contains(data[index].id),
                  onChanged: (selected) {
                    onMuscleStatusChanged(data[index], selected);
                  },
                ),
              ),
            ),
          ],
        );
      },
      error: (error, stackTrace) => CustomErrorWidget(text: error.toString()),
      loading: () => const LoaderWidget(
        text: "Loading muscle maps",
      ),
    );
  }
}
