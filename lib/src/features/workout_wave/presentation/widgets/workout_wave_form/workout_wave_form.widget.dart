import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/dto/workout_wave.dto.dart';
import 'package:fit_chrono/src/features/workout_wave/presentation/widgets/workout_wave_form/workouts_with_measure_list.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutWaveFormWidget extends ConsumerStatefulWidget {
  const WorkoutWaveFormWidget({super.key});

  @override
  ConsumerState<WorkoutWaveFormWidget> createState() =>
      _WorkoutWaveFormWidgetState();
}

class _WorkoutWaveFormWidgetState extends ConsumerState<WorkoutWaveFormWidget> {
  final _formKey = GlobalKey<FormState>();
  WorkoutWaveWithWorkoutsMeasureDto _workoutWaveWithWorkoutsMeasureDto =
      WorkoutWaveWithWorkoutsMeasureDto.init();

  void setWaveName(String? value) {
    _workoutWaveWithWorkoutsMeasureDto =
        _workoutWaveWithWorkoutsMeasureDto.copyWith(
      workoutWave:
          _workoutWaveWithWorkoutsMeasureDto.workoutWave.copyWith(name: value),
    );
  }

  void onWorkoutMeasureAdd(WorkoutWithMeasureDto workoutWithMeasure) {
    setState(() {
      _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure
          .add(workoutWithMeasure);
    });
  }

  void onAddedWorkoutWithMeasureRemove(int index) {
    setState(() {
      _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure.removeAt(index);
    });
  }

  void onAddedWorkoutWithMeasureEdit(
    int index,
    WorkoutWithMeasureDto workoutWithMeasure,
  ) {
    setState(() {
      _workoutWaveWithWorkoutsMeasureDto.workoutsWithMeasure[index] =
          workoutWithMeasure;
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _workoutWaveWithWorkoutsMeasureDto.workoutWave.name,
              decoration: const InputDecoration(
                label: Text("Workout Wave Name"),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) =>
                  cannotBeginWithDigitValidator("Workout wave name", value),
              onSaved: setWaveName,
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
              onAddedWorkoutWithMeasureRemove: onAddedWorkoutWithMeasureRemove,
              onAddedWorkoutWithMeasureEdit: onAddedWorkoutWithMeasureEdit,
            ),
          ],
        ),
      ),
    );
  }
}
