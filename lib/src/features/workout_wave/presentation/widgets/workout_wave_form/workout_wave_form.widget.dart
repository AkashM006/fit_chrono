import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/unsaved_form_dialog/unsaved_form_dialog.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/add_workout_wave/add_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/provider/edit_workout_wave/edit_workout_wave.provider.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workout_wave_error_dialog.widget.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workouts_with_measure_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class WorkoutWaveFormWidget extends ConsumerStatefulWidget {
  const WorkoutWaveFormWidget({
    super.key,
    this.workoutWaveWithWorkoutsMeasure,
  });

  final WorkoutWaveWithWorkoutsMeasureDto? workoutWaveWithWorkoutsMeasure;

  @override
  ConsumerState<WorkoutWaveFormWidget> createState() =>
      _WorkoutWaveFormWidgetState();
}

class _WorkoutWaveFormWidgetState extends ConsumerState<WorkoutWaveFormWidget> {
  final _formKey = GlobalKey<FormState>();
  WorkoutWaveWithWorkoutsMeasureDto _workoutWaveWithWorkoutsMeasureDto =
      WorkoutWaveWithWorkoutsMeasureDto.init();

  bool get canPop {
    if (isEditMode) {
      return _workoutWaveWithWorkoutsMeasureDto ==
          widget.workoutWaveWithWorkoutsMeasure;
    }

    return _workoutWaveWithWorkoutsMeasureDto ==
        WorkoutWaveWithWorkoutsMeasureDto.init();
  }

  bool get isEditMode => widget.workoutWaveWithWorkoutsMeasure != null;

  bool get isSubmitEnabled {
    if (!isEditMode) return true;

    return widget.workoutWaveWithWorkoutsMeasure !=
        _workoutWaveWithWorkoutsMeasureDto;
  }

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _workoutWaveWithWorkoutsMeasureDto =
          widget.workoutWaveWithWorkoutsMeasure!.copyWith();
    }
  }

  void setWaveName(String? value) {
    _workoutWaveWithWorkoutsMeasureDto =
        _workoutWaveWithWorkoutsMeasureDto.copyWith(
      workoutWave: _workoutWaveWithWorkoutsMeasureDto.workoutWave.copyWith(
        name: value,
      ),
    );
  }

  void onWorkoutMeasureAdd(WorkoutWithMeasureDto workoutWithMeasure) {
    setState(() {
      final newList = [
        ..._workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
      ];
      newList.add(workoutWithMeasure);
      _workoutWaveWithWorkoutsMeasureDto =
          _workoutWaveWithWorkoutsMeasureDto.copyWith(
        workoutsWithMeasure: newList,
      );
    });
  }

  void onAddedWorkoutWithMeasureRemove(int index) {
    setState(() {
      final newList = [
        ..._workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
      ];
      newList.removeAt(index);
      _workoutWaveWithWorkoutsMeasureDto =
          _workoutWaveWithWorkoutsMeasureDto.copyWith(
        workoutsWithMeasure: newList,
      );
    });
  }

  void onAddedWorkoutWithMeasureEdit(
    int index,
    WorkoutWithMeasureDto workoutWithMeasure,
  ) {
    setState(() {
      final newList = [
        ..._workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
      ];
      newList[index] = workoutWithMeasure;
      _workoutWaveWithWorkoutsMeasureDto =
          _workoutWaveWithWorkoutsMeasureDto.copyWith(
        workoutsWithMeasure: newList,
      );
    });
  }

  void onCreateWorkoutWave() {
    if (!_formKey.currentState!.validate()) return;

    if (_workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure.isEmpty) {
      showDialog(
        context: context,
        builder: (context) => const WorkoutWaveErrorDialogWidget(),
      );
      return;
    }

    _formKey.currentState!.save();

    final workoutsWithMeasure =
        _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure;

    for (var i = 0; i < workoutsWithMeasure.length; i++) {
      workoutsWithMeasure[i] = workoutsWithMeasure[i].copyWith(
        position: i,
      );
    }

    if (!isEditMode) {
      ref
          .read(addWorkoutWaveProvider.notifier)
          .go(_workoutWaveWithWorkoutsMeasureDto);
      return;
    }

    ref
        .read(editWorkoutWaveProvider.notifier)
        .go(_workoutWaveWithWorkoutsMeasureDto);
  }

  void onReorder(int oldIndex, int newIndex) {
    setState(() {
      if (oldIndex < newIndex) newIndex -= 1;
      final item = _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
          .removeAt(oldIndex);
      _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
          .insert(newIndex, item);
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
          builder: (context) =>
              const UnsavedFormDialogWidget(item: "workout wave"),
        );
      },
      child: Form(
        key: _formKey,
        child: Expanded(
          child: Column(
            children: [
              TextFormField(
                initialValue:
                    _workoutWaveWithWorkoutsMeasureDto.workoutWave.name,
                decoration: const InputDecoration(
                  label: Text("Workout Wave Name"),
                ),
                textCapitalization: TextCapitalization.sentences,
                validator: (value) =>
                    cannotBeginWithDigitValidator("Workout wave name", value),
                onSaved: setWaveName,
                onChanged: (value) {
                  setState(() {
                    setWaveName(value);
                  });
                },
                maxLength: 32,
              ),
              const SizedBox(
                height: 20,
              ),
              WorkoutsWithMeasureListWidget(
                workoutsWithMeasure:
                    _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure,
                workoutWaveName:
                    _workoutWaveWithWorkoutsMeasureDto.workoutWave.name,
                onWorkoutMeasureAdd: onWorkoutMeasureAdd,
                onAddedWorkoutWithMeasureRemove:
                    onAddedWorkoutWithMeasureRemove,
                onAddedWorkoutWithMeasureEdit: onAddedWorkoutWithMeasureEdit,
                onReorder: onReorder,
              ),
              const SizedBox(
                height: 10,
              ),
              FilledButton(
                onPressed: isSubmitEnabled ? onCreateWorkoutWave : null,
                child: Text(isEditMode ? "Edit" : "Go"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
