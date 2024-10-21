import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/provider/add_muscle_map/add_muscle_map.provider.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_description.widget.dart';
import 'package:fit_chrono/src/features/muscle_maps/presentation/widgets/muscle_map_form/muscle_map_form.widget.dart';
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
        if (next is DataSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text("Added to your muscle map"),
            ),
          );
          context.pop();
        } else if (next is DataFailure) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text(
                "Something went wrong when trying to add to your muscle map. Please try again later!",
              ),
            ),
          );
        }
      },
    );

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        padding: EdgeInsets.symmetric(
          vertical: SizeConfig.safeBlockVertical * 2,
          horizontal: SizeConfig.safeBlockHorizontal * 5,
        ),
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 500),
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
