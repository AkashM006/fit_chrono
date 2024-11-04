import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/add_muscle_map/add_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/update_muscle_map/update_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_spinner/custom_spinner.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/unsaved_form_dialog/unsaved_form_dialog.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MuscleMapFormWidget extends ConsumerStatefulWidget {
  const MuscleMapFormWidget({
    super.key,
    this.muscleMap,
  });

  final MuscleMapDto? muscleMap;

  @override
  ConsumerState<MuscleMapFormWidget> createState() =>
      _MuscleMapFormWidgetState();
}

class _MuscleMapFormWidgetState extends ConsumerState<MuscleMapFormWidget> {
  final _formKey = GlobalKey<FormState>();

  MuscleMapDto _muscleMap = MuscleMapDto.init();

  Widget loaderWidget = SizedBox(
    height: SizeConfig.safeBlockVertical * 5,
    child: const AspectRatio(
      aspectRatio: 1,
      child: CustomSpinnerWidget(),
    ),
  );

  bool get isEditMode => widget.muscleMap != null;
  bool get hasEdited {
    if (!isEditMode) return false;

    return widget.muscleMap!.name != _muscleMap.name;
  }

  bool get isSubmitEnabled {
    if (isEditMode) {
      return hasEdited && _muscleMap.name.isNotEmpty;
    }

    return true;
  }

  bool get canPop {
    return (!isEditMode && _muscleMap.name.isEmpty) ||
        (isEditMode && _muscleMap.name == widget.muscleMap!.name);
  }

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    if (isEditMode) {
      final newMuscleMap = widget.muscleMap!.copyWith(name: _muscleMap.name);
      ref.read(updateMuscleMapProvider.notifier).go(newMuscleMap);
      return;
    }

    final newMuscleMap = MuscleMapDto(name: _muscleMap.name);

    ref.read(addMuscleMapProvider.notifier).go(newMuscleMap);
  }

  @override
  void initState() {
    super.initState();
    _muscleMap = _muscleMap.copyWith(
      name: isEditMode ? widget.muscleMap!.name : "",
    );
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addMuscleMapStatus = ref.watch(addMuscleMapProvider);
    final updateMuscleMapStatus = ref.watch(updateMuscleMapProvider);

    final isAddLoading = addMuscleMapStatus is DataLoading;
    final isUpdateLoading = updateMuscleMapStatus is DataLoading;

    final isLoading = isEditMode ? isUpdateLoading : isAddLoading;

    void setName(String value) {
      setState(() {
        _muscleMap = _muscleMap.copyWith(
          name: value,
        );
      });
    }

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
          builder: (context) => const UnsavedFormDialogWidget(
            item: "muscle map",
          ),
        );
      },
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              initialValue: _muscleMap.name,
              decoration: const InputDecoration(
                label: Text("Enter Name"),
              ),
              onSaved: (newValue) {
                _muscleMap = _muscleMap.copyWith(name: newValue);
              },
              onChanged: isEditMode ? setName : null,
              validator: (value) =>
                  cannotBeginWithDigitValidator("Name", value),
              maxLength: 32,
              enabled: !isLoading,
            ),
            FilledButton(
              onPressed: isLoading
                  ? null
                  : isSubmitEnabled
                      ? handleSubmit
                      : null,
              child: isLoading
                  ? const CustomSpinnerWidget()
                  : Text(isEditMode ? "Edit" : "Go"),
            ),
          ],
        ),
      ),
    );
  }
}
