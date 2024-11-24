import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/button_loader/button_loader.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/unsaved_form_dialog/unsaved_form_dialog.widget.dart';
import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/add_workout/add_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/delete_workout/delete_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/provider/update_workout/update_workout.provider.dart';
import 'package:fit_chrono/src/features/workout/presentation/widget/workout_form/muscle_map_selection_field.widget.dart';
import 'package:flutter/material.dart';
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
  final TextEditingController _nameController = TextEditingController();

  WorkoutDto _workout = WorkoutDto.init();

  bool get isEditMode => widget.workout != null;

  bool get isSubmitEnabled => isEditMode ? (widget.workout != _workout) : true;

  bool get canPop {
    if (isEditMode) {
      return widget.workout == _workout;
    }

    return _workout.name.isEmpty && _workout.muscles.isEmpty;
  }

  @override
  void initState() {
    super.initState();
    if (isEditMode) {
      _workout = widget.workout!;
      _nameController.text = widget.workout!.name;
    }
  }

  void onMuscleDelete(int id) {
    setState(() {
      _workout = _workout.copyWith(
        muscles: _workout.muscles.where((muscle) => muscle.id != id).toList(),
      );
    });
  }

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    if (isEditMode) {
      ref.read(updateWorkoutProvider.notifier).go(_workout, widget.workout!);
      return;
    }

    ref.read(addWorkoutProvider.notifier).go(_workout);
  }

  void setName(String? value) {
    _workout = _workout.copyWith(
      name: value,
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
    final addWorkoutStatus = ref.watch(addWorkoutProvider);
    final updateWorkoutStatus = ref.watch(updateWorkoutProvider);
    final deleteWorkoutStatus = ref.watch(deleteWorkoutProvider);

    final isAddLoading = addWorkoutStatus is DataLoading;
    final isUpdateLoading = updateWorkoutStatus is DataLoading;
    final isDeleteLoading = deleteWorkoutStatus?.isLoading ?? false;

    final areTextFieldsEnabled =
        !isAddLoading && !isUpdateLoading && !isDeleteLoading;
    final isSubmitButtonEnabled = isSubmitEnabled && areTextFieldsEnabled;

    ref.listen(
      addWorkoutProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            setState(() {
              _workout = WorkoutDto.init();
            });
            _nameController.text = "";
          },
          failed: (error) => {},
        );
      },
    );

    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) return;
        _formKey.currentState!.save();
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
              // initialValue: _workout.name,
              controller: _nameController,
              decoration: const InputDecoration(
                label: Text("Enter Name"),
              ),
              textCapitalization: TextCapitalization.sentences,
              validator: (value) =>
                  cannotBeginWithDigitValidator("Name", value),
              onSaved: setName,
              enabled: areTextFieldsEnabled,
              onChanged: isEditMode
                  ? (value) {
                      setState(() {
                        setName(value);
                      });
                    }
                  : null,
              maxLength: 32,
            ),
            SizedBox(
              height: SizeConfig.safeBlockVertical * 2,
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
                isEnabled: areTextFieldsEnabled,
              ),
            ),
            const SizedBox(
              height: 25,
            ),
            FilledButton(
              onPressed: isSubmitButtonEnabled ? handleSubmit : null,
              child: !isAddLoading && !isUpdateLoading
                  ? const Text("Save")
                  : const ButtonLoaderWidget(),
            ),
          ],
        ),
      ),
    );
  }
}
