import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/get_muscle_map/get_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/update_muscle_map/update_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_form.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/custom_error/custom_error.widget.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/loader/loader.widget.dart';
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
      return Scaffold(
        appBar: AppBar(
          title: const Text("Not Found"),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: BoxConstraints(
              maxWidth: SizeConfig.safeBlockHorizontal * 70,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "It seems like we couldn't locate that muscle map. Don't worry, even the strongest have weak spots!",
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        fontStyle: FontStyle.italic,
                      ),
                ),
                SizedBox(
                  height: SizeConfig.safeBlockVertical * 2,
                ),
                TextButton(
                  onPressed: onNewMuscleMap,
                  child: const Text("Add Muscle Map"),
                ),
              ],
            ),
          ),
        ),
      );
    }

    ref.listen(
      updateMuscleMapProvider,
      (previous, next) {
        if (next is DataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Updated your muscle map"),
            ),
          );
          context.pop();
        } else if (next is DataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(next.toString()),
            ),
          );
        }
      },
    );

    final muscleMap = ref.watch(muscleMapProvider(id!));

    return Scaffold(
      appBar: AppBar(
        title: const Text("Muscle Map"),
      ),
      body: muscleMap.when(
        data: (data) {
          return SingleChildScrollView(
            padding: AppOffsets.screenPadding,
            child: ConstrainedBox(
              constraints: AppOffsets.formWidthConstraint,
              child: Column(
                children: [
                  MuscleMapFormWidget(
                    muscleMap: data,
                  ),
                ],
              ),
            ),
          );
        },
        error: (error, stackTrace) => Center(
          child: CustomErrorWidget(text: error.toString()),
        ),
        loading: () => const Center(child: LoaderWidget()),
      ),
    );
  }
}
