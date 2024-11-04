import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/muscle_maps.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_maps/muscle_maps_empty.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutMuscleBottomSheetWidget extends ConsumerStatefulWidget {
  const WorkoutMuscleBottomSheetWidget({
    super.key,
    required this.selectedMuscles,
    required this.onMuscleMapSave,
  });

  final List<MuscleMapDto> selectedMuscles;
  final void Function(List<MuscleMapDto> muscle) onMuscleMapSave;

  @override
  ConsumerState<WorkoutMuscleBottomSheetWidget> createState() =>
      _WorkoutMuscleBottomSheetWidgetState();
}

class _WorkoutMuscleBottomSheetWidgetState
    extends ConsumerState<WorkoutMuscleBottomSheetWidget> {
  List<int> _selectedMuscleIds = [];
  List<MuscleMapDto> _selectedMuscles = [];

  @override
  void initState() {
    super.initState();
    for (var selectedMuscle in widget.selectedMuscles) {
      _selectedMuscleIds.add(selectedMuscle.id);
      _selectedMuscles.add(selectedMuscle);
    }
  }

  @override
  Widget build(BuildContext context) {
    final muscles = ref.watch(muscleMapsProvider);

    void onMuscleStatusChanged(
      MuscleMapDto muscle,
      bool? selected,
    ) {
      if (selected == null) return;

      setState(() {
        if (_selectedMuscleIds.contains(muscle.id)) {
          _selectedMuscleIds =
              _selectedMuscleIds.where((id) => id != muscle.id).toList();
          _selectedMuscles = _selectedMuscles
              .where((selectedMuscle) => selectedMuscle.id != muscle.id)
              .toList();
        } else {
          _selectedMuscleIds = [..._selectedMuscleIds, muscle.id];
          _selectedMuscles = [..._selectedMuscles, muscle];
        }
      });
    }

    void onMuscleMapSave() {
      widget.onMuscleMapSave(_selectedMuscles);
      context.pop();
    }

    return AsyncValueBuilderWidget(
      asyncValue: muscles,
      builder: (context, data) {
        if (data.isEmpty) {
          return const MuscleMapsEmptyWidget();
        }

        return Align(
          alignment: Alignment.topLeft,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                    value: _selectedMuscleIds.contains(data[index].id),
                    onChanged: (selected) {
                      onMuscleStatusChanged(data[index], selected);
                    },
                    title: Text(
                      data[index].name,
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              OutlinedButton(
                onPressed: onMuscleMapSave,
                child: const Text("Save"),
              ),
            ],
          ),
        );
      },
    );
  }
}
