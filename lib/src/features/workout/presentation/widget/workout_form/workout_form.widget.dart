import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/workout_muscle_bottom_sheet.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutFormWidget extends ConsumerStatefulWidget {
  const WorkoutFormWidget({
    super.key,
    this.workout,
  });

  final WorkoutDto? workout;

  @override
  ConsumerState<WorkoutFormWidget> createState() => _WorkoutFormWidgetState();
}

class _WorkoutFormWidgetState extends ConsumerState<WorkoutFormWidget> {
  final _formKey = GlobalKey<FormState>();

  WorkoutDto _workout = WorkoutDto.init();

  bool get isEditMode => widget.workout != null;

  bool get isSubmitEnabled {
    return false;
  }

  bool get isReps {
    return _workout.measure == WorkoutMeasureDto.reps;
  }

  void onMeasureChanged(WorkoutMeasureDto? measure) {
    setState(() {
      _workout = _workout.copyWith(
        measure: measure,
      );
    });
  }

  void onAddMuscle(MuscleMapDto muscle) {
    setState(() {
      _workout = _workout.copyWith(
        muscles: [..._workout.muscles, muscle],
      );
    });
  }

  void onMuscleRemove(int muscleId) {
    setState(() {
      _workout = _workout.copyWith(
        muscles:
            _workout.muscles.where((muscle) => muscle.id != muscleId).toList(),
      );
    });
  }

  void handleSubmit() {
    // todo: Handle submit and validation
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _workout.name,
              decoration: const InputDecoration(
                label: Text("Enter Name"),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 250),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      flex: 2,
                      child: TextFormField(
                        decoration: InputDecoration(
                          label: Text(isReps ? "Count" : "Seconds"),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    MuscleTypeField(
                      value: _workout.measure,
                      onChanged: onMeasureChanged,
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: Text(
                "Workout Targets",
                style: Theme.of(context).textTheme.headlineSmall,
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Align(
              alignment: Alignment.topLeft,
              child: MuscleMapSelectionField(
                muscles: _workout.muscles,
                onAddMuscle: onAddMuscle,
                onRemoveMuscle: onMuscleRemove,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FilledButton(
              onPressed: handleSubmit,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}

class MuscleMapSelectionField extends StatelessWidget {
  const MuscleMapSelectionField({
    super.key,
    required this.muscles,
    required this.onAddMuscle,
    required this.onRemoveMuscle,
  });

  final List<MuscleMapDto> muscles;
  final void Function(MuscleMapDto muscle) onAddMuscle;
  final void Function(int id) onRemoveMuscle;

  @override
  Widget build(BuildContext context) {
    void onAddMuscleMap() {
      showModalBottomSheet(
        context: context,
        builder: (context) => Container(
          padding: const EdgeInsets.all(20),
          width: SizeConfig.safeBlockHorizontal * 100,
          child: const WorkoutMuscleBottomSheetWidget(),
        ),
      );
    }

    void onDeleteMuscleMap() {}

    final widgetsList = [
      OutlinedButton.icon(
        onPressed: onAddMuscleMap,
        icon: const Icon(Icons.add),
        label: const Text("Add a muscle"),
      ),
      ...muscles.map(
        (muscle) => InputChip(
          label: Text(muscle.name),
          onDeleted: onDeleteMuscleMap,
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

class MuscleTypeField extends StatelessWidget {
  const MuscleTypeField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final WorkoutMeasureDto value;
  final void Function(WorkoutMeasureDto? selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DropdownButtonFormField<WorkoutMeasureDto>(
        menuMaxHeight: double.infinity,
        value: value,
        items: const [
          DropdownMenuItem(
            value: WorkoutMeasureDto.reps,
            child: Text("Reps"),
          ),
          DropdownMenuItem(
            value: WorkoutMeasureDto.time,
            child: Text("Time"),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
