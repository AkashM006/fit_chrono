import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/delete_muscle_map/delete_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/get_muscle_map/get_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/update_muscle_map/update_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map/muscle_map_detail_appbar.widget.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_form.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/entity_not_found.screen.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/async_value_builder/async_value_builder.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_async_appbar/custom_async_appbar.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/snackbar/snackbar.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class MuscleMapDetailScreen extends ConsumerWidget {
  const MuscleMapDetailScreen({
    super.key,
    this.id,
  });

  final int? id;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onNewMuscleMap() {
      context.pushReplacement(PAGES.muscleMapForm.path);
    }

    if (id == null) {
      return EntityNotFoundScreen(
        title: "💪",
        content:
            "It seems like we couldn't locate that muscle map. Don't worry, even the strongest have weak spots!",
        actions: [
          TextButton(
            onPressed: onNewMuscleMap,
            child: const Text("Add Muscle Map"),
          ),
        ],
      );
    }

    ref.listen(
      updateMuscleMapProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    ref.listen(
      deleteMuscleMapProvider,
      (previous, next) {
        next?.on(
          success: (data) {
            showSnackBar(context, data);
            context.pop();
          },
          failed: (error) {
            showSnackBar(context, error.toString());
          },
        );
      },
    );

    final muscleMap = ref.watch(muscleMapProvider(id!));

    return Scaffold(
      appBar: CustomAsyncAppBar(
        asyncData: muscleMap,
        builder: (context, data) => MuscleMapDetailAppbarWidget(
          muscleMap: data,
        ),
      ),
      body: AsyncValueBuilderWidget(
        asyncValue: muscleMap,
        builder: (context, data) => SingleChildScrollView(
          padding: AppOffsets.screenPadding,
          child: ConstrainedBox(
            constraints: AppOffsets.formWidthConstraint,
            child: MuscleMapFormWidget(
              muscleMap: data,
            ),
          ),
        ),
      ),
    );
  }
}
