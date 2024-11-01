import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_muscle_bottom_sheet.widget.dart';
import 'package:flutter/material.dart';

class MuscleMapSelectionField extends StatelessWidget {
  const MuscleMapSelectionField({
    super.key,
    required this.muscles,
    required this.setMuscles,
    this.isEnabled = true,
  });

  final List<MuscleMapDto> muscles;
  final void Function(List<MuscleMapDto> muscles) setMuscles;
  final bool isEnabled;

  @override
  Widget build(BuildContext context) {
    void onAddMuscleMap() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(20),
          width: SizeConfig.safeBlockHorizontal * 100,
          child: WorkoutMuscleBottomSheetWidget(
            selectedMuscles: muscles,
            onMuscleMapSave: setMuscles,
          ),
        ),
      );
    }

    void onDeleteMuscleMap(int id) {
      final removedMuscles =
          muscles.where((muscle) => muscle.id != id).toList();
      setMuscles(removedMuscles);
    }

    final widgetsList = [
      OutlinedButton.icon(
        onPressed: isEnabled ? onAddMuscleMap : null,
        icon: const Icon(Icons.add),
        label: const Text("Add muscle maps"),
      ),
      ...muscles.map(
        (muscle) => InputChip(
          label: Text(muscle.name),
          onDeleted: () => onDeleteMuscleMap(muscle.id),
        ),
      ),
    ];

    return Wrap(
      spacing: 10,
      runSpacing: 10,
      children: widgetsList,
    );
  }
}
