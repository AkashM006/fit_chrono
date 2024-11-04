import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/add_muscle_map/add_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_description.widget.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_form.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MuscleMapFormScreen extends ConsumerWidget {
  const MuscleMapFormScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen(
      addMuscleMapProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pushReplacement(PAGES.muscleMapForm.path);
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: AppOffsets.screenPadding,
        child: ConstrainedBox(
          constraints: AppOffsets.formWidthConstraint,
          child: Column(
            children: [
              const MuscleMapDescriptionWidget(),
              SizedBox(
                height: SizeConfig.safeBlockVertical * 4,
              ),
              const MuscleMapFormWidget()
            ],
          ),
        ),
      ),
    );
  }
}
