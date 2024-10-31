import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/unsaved_form_dialog/unsaved_form_dialog.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/muscle_map_selection_field.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/muscle_type_field.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
    if (!isEditMode) return true;

    return false;
  }

  bool get isReps {
    return _workout.measure == WorkoutMeasureDto.reps;
  }

  bool get canPop {
    if (isEditMode) return true;

    return _workout.name.isEmpty &&
        _workout.muscles.isEmpty &&
        _workout.count == 0;
  }

  void onMeasureChanged(WorkoutMeasureDto? measure) {
    setState(() {
      _workout = _workout.copyWith(
        measure: measure,
      );
    });
  }

  void onMuscleDelete(int id) {
    setState(() {
      _workout = _workout.copyWith(
        muscles: _workout.muscles.where((muscle) => muscle.id != id).toList(),
      );
    });
  }

  void handleSubmit() {
    // todo: Handle submit and validation
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();
  }

  void setName(String? value) {
    _workout = _workout.copyWith(
      name: value,
    );
  }

  void setCount(String? value) {
    final count = int.tryParse(value ?? "");

    _workout = _workout.copyWith(
      count: count,
    );
  }

  void setMuscles(List<MuscleMapDto> muscles) {
    setState(() {
      _workout = _workout.copyWith(
        muscles: muscles,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        if (canPop) {
          context.pop();
          return;
        }

        showDialog(
          context: context,
          builder: (context) => const UnsavedFormDialogWidget(item: "workout"),
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _workout.name,
              decoration: const InputDecoration(
                label: Text("Enter Name"),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) =>
                  cannotBeginWithDigitValidator("Name", value),
              onChanged: setName,
              onSaved: setName,
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
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: false,
                          signed: false,
                        ),
                        inputFormatters: <TextInputFormatter>[
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                        validator: (value) => requiredValidator(
                          isReps ? "Count" : "Seconds",
                          value,
                        ),
                        onChanged: setCount,
                        onSaved: setCount,
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
                setMuscles: setMuscles,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FilledButton(
              onPressed: isSubmitEnabled ? handleSubmit : null,
              child: const Text("Save"),
            ),
          ],
        ),
      ),
    );
  }
}
