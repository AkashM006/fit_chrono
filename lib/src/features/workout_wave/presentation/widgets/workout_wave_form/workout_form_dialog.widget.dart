import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_radio_button/custom_radio_button.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workouts/searchable_workout_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

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
  final TextEditingController _minuteController = TextEditingController();
  final TextEditingController _secondsController = TextEditingController();
  WorkoutWithMeasureDto _workoutWithMeasure = WorkoutWithMeasureDto.init();

  bool get isEditMode => widget.workoutWithMeasure != null;

  String get minutes => _minuteController.text;
  String get seconds => _secondsController.text;
  bool get isRest => _workoutWithMeasure.workout.isRest;

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _workoutWithMeasure = widget.workoutWithMeasure!;
      if (widget.workoutWithMeasure!.workoutMeasure == WorkoutMeasureDto.time) {
        _minuteController.text = (_workoutWithMeasure.count ~/ 60).toString();
        _secondsController.text = (_workoutWithMeasure.count % 60).toString();
      }
    }

    _workoutNameController.text = _workoutWithMeasure.workout.name;
  }

  @override
  void dispose() {
    super.dispose();
    _workoutNameController.dispose();
    _minuteController.dispose();
    _secondsController.dispose();
  }

  void onWorkoutSelect() async {
    final selectedWorkout = await showModalBottomSheet<WorkoutDto>(
      context: context,
      builder: (context) => const SearchableWorkoutListWidget(),
      useSafeArea: true,
      isScrollControlled: true,
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

  void onAddWorkoutWithMeasure() {
    if (!_formKey.currentState!.validate()) return;
    _formKey.currentState!.save();

    if (_workoutWithMeasure.workoutMeasure == WorkoutMeasureDto.time) {
      _workoutWithMeasure = _workoutWithMeasure.copyWith(
        count: _workoutWithMeasure.count,
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

  String? validateTime(bool isSecond) {
    const secondsErrorMessage = ' ';
    final minuteRequired = requiredValidator("Time", minutes);
    final secondsRequired = requiredValidator("Time", seconds);

    if (minuteRequired != null && secondsRequired != null) {
      if (isSecond) return secondsErrorMessage;
      return minuteRequired;
    }

    if (minuteRequired == null) {
      final isMinuteANumber = mustBeNumber("Time", minutes);
      if (isMinuteANumber != null) {
        if (isSecond) return secondsErrorMessage;
        return isMinuteANumber;
      }
    }

    if (secondsRequired == null) {
      final isSecondsANumber = mustBeNumber("Time", seconds);
      if (isSecondsANumber != null) {
        if (isSecond) return secondsErrorMessage;
        return isSecondsANumber;
      }
    }

    final parsedMinutes = int.tryParse(minutes) ?? 0;
    final parsedSeconds = int.tryParse(seconds) ?? 0;

    final totalTime = parsedMinutes * 60 + parsedSeconds;

    final totalTimeNotZero =
        numberGreaterThanZero("Time", totalTime.toString());

    if (totalTimeNotZero != null) {
      if (isSecond) return '';
      return totalTimeNotZero;
    }

    return null;
  }

  String? validateSeconds(String? value) => validateTime(true);
  String? validateMinutes(String? value) => validateTime(false);

  void onSaveTime(String? newValue) {
    final parsedMinutes = int.tryParse(minutes) ?? 0;
    final parsedSeconds = int.tryParse(seconds) ?? 0;
    _workoutWithMeasure = _workoutWithMeasure.copyWith(
      count: parsedMinutes * 60 + parsedSeconds,
    );
  }

  @override
  Widget build(BuildContext context) {
    final keyboardSpace = MediaQuery.of(context).viewInsets.bottom;

    final bodyMedium = Theme.of(context).textTheme.bodyMedium;

    final countTextFieldWidth = SizeConfig.safeBlockHorizontal * 45;

    final isReps = _workoutWithMeasure.workoutMeasure == WorkoutMeasureDto.reps;
    final measureLabel = isReps ? "Reps" : "Time";

    final inputFormatters = [
      FilteringTextInputFormatter.digitsOnly,
    ];

    final repsFormField = SizedBox(
      width: countTextFieldWidth,
      child: TextFormField(
        initialValue: isEditMode &&
                widget.workoutWithMeasure!.workoutMeasure ==
                    WorkoutMeasureDto.reps
            ? _workoutWithMeasure.count.toString()
            : null,
        decoration: const InputDecoration(
          label: Text("Reps"),
        ),
        keyboardType: const TextInputType.numberWithOptions(),
        validator: (value) => numberGreaterThanZero(measureLabel, value),
        onSaved: setCount,
        inputFormatters: inputFormatters,
      ),
    );

    final timeFormField = Row(
      children: [
        Expanded(
          child: TextFormField(
            controller: _minuteController,
            decoration: const InputDecoration(label: Text("Minutes")),
            inputFormatters: inputFormatters,
            validator: validateMinutes,
            onSaved: onSaveTime,
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Expanded(
          child: TextFormField(
            controller: _secondsController,
            decoration: const InputDecoration(
              label: Text('Seconds'),
            ),
            inputFormatters: inputFormatters,
            validator: validateSeconds,
            keyboardType: const TextInputType.numberWithOptions(),
          ),
        ),
        const SizedBox(
          width: 50,
        ),
      ],
    );

    final actionLabel = isEditMode ? "Edit" : "Add";

    return SingleChildScrollView(
      padding: EdgeInsets.fromLTRB(20, 20, 20, keyboardSpace + 20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "$actionLabel Workout",
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
                  value: WorkoutMeasureDto.time,
                  groupValue: _workoutWithMeasure.workoutMeasure,
                  onChanged: setWorkoutMeasure,
                  label: const Text("Time"),
                ),
                const SizedBox(
                  width: 25,
                ),
                CustomRadioButtonWidget<WorkoutMeasureDto>(
                  value: WorkoutMeasureDto.reps,
                  groupValue: _workoutWithMeasure.workoutMeasure,
                  onChanged: isRest? null: setWorkoutMeasure,
                  label: const Text("Reps"),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            isReps ? repsFormField : timeFormField,
            const SizedBox(
              height: 30,
            ),
            FilledButton(
              onPressed: onAddWorkoutWithMeasure,
              child: Text(actionLabel),
            ),
          ],
        ),
      ),
    );
  }
}
