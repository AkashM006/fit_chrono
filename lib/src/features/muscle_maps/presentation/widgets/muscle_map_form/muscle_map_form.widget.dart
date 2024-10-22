import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/form_validator.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/add_muscle_map/add_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/update_muscle_map/update_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/shared/presentation/custom_spinner/custom_spinner.widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MuscleMapFormWidget extends ConsumerStatefulWidget {
  const MuscleMapFormWidget({
    super.key,
    this.muscleMap,
  });

  /// Provided only in case of edit
  final MuscleMapEntity? muscleMap;

  @override
  ConsumerState<MuscleMapFormWidget> createState() =>
      _MuscleMapFormWidgetState();
}

class _MuscleMapFormWidgetState extends ConsumerState<MuscleMapFormWidget> {
  final _formKey = GlobalKey<FormState>();

  String _name = "";

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

    return widget.muscleMap!.name != _name;
  }

  bool get isSubmitEnabled {
    if (isEditMode) {
      return hasEdited && _name.isNotEmpty;
    }

    return _name.isNotEmpty;
  }

  void handleSubmit() {
    if (!_formKey.currentState!.validate()) return;

    _formKey.currentState!.save();

    if (isEditMode) {
      // ref.read(updateMuscleMapProvider.notifier).go()
      return;
    }

    ref.read(addMuscleMapProvider.notifier).go(_name);
  }

  @override
  void initState() {
    super.initState();
    _name = isEditMode ? widget.muscleMap!.name : "";
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final addMuscleMapStatus = ref.watch(addMuscleMapProvider);
    final updateMuscleMapStatus = ref.watch(updateMuscleMapProvider);

    final isAddLoading = addMuscleMapStatus?.isLoading ?? false;
    final isUpdateLoading = updateMuscleMapStatus?.isLoading ?? false;

    final isLoading = isEditMode ? isUpdateLoading : isAddLoading;

    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            initialValue: _name,
            decoration: const InputDecoration(
              label: Text("Enter Name"),
            ),
            onSaved: (newValue) {
              _name = newValue!;
            },
            onChanged: (value) {
              setState(() {
                _name = value;
              });
            },
            validator: (value) => cannotBeginWithDigitValidator("Name", value),
            maxLength: 24,
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
    );
  }
}
