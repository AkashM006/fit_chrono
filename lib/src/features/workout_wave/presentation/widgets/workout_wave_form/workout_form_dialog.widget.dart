import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_radio_button/custom_radio_button.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/searchable_workout_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

enum Time {
  seconds,
  minutes,
}

class WorkoutFormDialogWidget extends ConsumerStatefulWidget {
  const WorkoutFormDialogWidget({
    super.key,
    this.workoutWithMeasure,
    required this.onWorkoutMeasureAdd,
  });

  final WorkoutWithMeasureDto? workoutWithMeasure;
  final void Function(WorkoutWithMeasureDto workoutWithMeasure)
      onWorkoutMeasureAdd;

  @override
  ConsumerState<WorkoutFormDialogWidget> createState() =>
      _WorkoutFormDialogWidgetState();
}

class _WorkoutFormDialogWidgetState
    extends ConsumerState<WorkoutFormDialogWidget> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _workoutNameController = TextEditingController();
  WorkoutWithMeasureDto _workoutWithMeasure = WorkoutWithMeasureDto.init();
  Time _selectedTime = Time.seconds;

  bool get isEditMode => widget.workoutWithMeasure != null;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _workoutWithMeasure = widget.workoutWithMeasure!;
      _workoutNameController.text = widget.workoutWithMeasure!.workout.name;
    }
  }

  @override
  void dispose() {
    super.dispose();
    _workoutNameController.dispose();
  }

  void onWorkoutSelect() async {
    final selectedWorkout = await showModalBottomSheet<WorkoutDto>(
      context: context,
      builder: (context) => const SearchableWorkoutListWidget(),
    );

    if (selectedWorkout == null) return;

    setState(() {
      _workoutWithMeasure = _workoutWithMeasure.copyWith(
        workout: selectedWorkout,
      );
      _workoutNameController.text = selectedWorkout.name;
    });
  }

  void setWorkoutMeasure(WorkoutMeasureDto? workoutMeasure) {
    setState(() {
      _workoutWithMeasure = _workoutWithMeasure.copyWith(
        workoutMeasure: workoutMeasure,
      );
    });
  }

  void onTimeChanged(Time? newTime) {
    if (newTime == null) return;
    setState(() {
      _selectedTime = newTime;
    });
  }

  void onAddWorkoutWithMeasure() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_workoutWithMeasure.workoutMeasure == WorkoutMeasureDto.time &&
        _selectedTime == Time.minutes) {
      _workoutWithMeasure = _workoutWithMeasure.copyWith(
        count: _workoutWithMeasure.count * 60,
      );
    }

    widget.onWorkoutMeasureAdd(_workoutWithMeasure);

    context.pop();
  }

  void setCount(String? value) {
    if (value == null || value.isEmpty) return;
    _workoutWithMeasure = _workoutWithMeasure.copyWith(
      count: int.tryParse(value),
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    final countTextFieldWidth = SizeConfig.safeBlockHorizontal * 45;

    final repsFormField = SizedBox(
      width: countTextFieldWidth,
      child: TextFormField(
        initialValue: _workoutWithMeasure.count.toString(),
        decoration: const InputDecoration(
          label: Text("Reps"),
        ),
        validator: (value) => numberGreaterThanZero("Reps", value),
        onSaved: setCount,
      ),
    );

    final timeFormField = Row(
      children: [
        SizedBox(
          width: countTextFieldWidth,
          child: TextFormField(
            initialValue: _workoutWithMeasure.count.toString(),
            decoration: const InputDecoration(
              label: Text("Time"),
            ),
            validator: (value) => numberGreaterThanZero("Time", value),
            onSaved: setCount,
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        DropdownButton<Time>(
          value: _selectedTime,
          items: Time.values
              .map(
                (time) => DropdownMenuItem<Time>(
                  value: time,
                  child: Text(time.name.toString().capitalize()),
                ),
              )
              .toList(),
          onChanged: onTimeChanged,
        )
      ],
    );

    return SizedBox(
      height: double.infinity,
      width: double.infinity,
      child: SingleChildScrollView(
        padding: EdgeInsets.fromLTRB(20, 20, 20, keyboardSpace + 20),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Add Workout",
                style: Theme.of(context).textTheme.headlineLarge,
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                      controller: _workoutNameController,
                      decoration: InputDecoration(
                        hintText: "Select a workout",
                        enabled: false,
                        hintStyle: bodyMedium!.copyWith(
                          color: Theme.of(context).colorScheme.tertiary,
                        ),
                      ),
                      validator: (value) =>
                          cannotBeginWithDigitValidator("Workout name", value),
                      style: bodyMedium.copyWith(
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: onWorkoutSelect,
                    child: const Text("Select workout"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  CustomRadioButtonWidget<WorkoutMeasureDto>(
                    value: WorkoutMeasureDto.reps,
                    groupValue: _workoutWithMeasure.workoutMeasure,
                    onChanged: setWorkoutMeasure,
                    label: const Text("Reps"),
                  ),
                  const SizedBox(
                    width: 25,
                  ),
                  CustomRadioButtonWidget<WorkoutMeasureDto>(
                    value: WorkoutMeasureDto.time,
                    groupValue: _workoutWithMeasure.workoutMeasure,
                    onChanged: setWorkoutMeasure,
                    label: const Text("Time"),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              _workoutWithMeasure.workoutMeasure == WorkoutMeasureDto.reps
                  ? repsFormField
                  : timeFormField,
              const SizedBox(
                height: 30,
              ),
              FilledButton(
                onPressed: onAddWorkoutWithMeasure,
                child: Text(isEditMode ? "Edit" : "Add"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
