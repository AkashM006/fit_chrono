import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:fit_chrono/src/features/muscle_maps/domain/entity/muscle_map.entity.dart';
import 'package:flutter/material.dart';

class MuscleMapsListWidget extends StatelessWidget {
  const MuscleMapsListWidget({
    super.key,
    required this.muscleMaps,
  });

  final List<MuscleMapEntity> muscleMaps;

  @override
  Widget build(BuildContext context) {
    if (muscleMaps.isEmpty) {
      return Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxWidth: SizeConfig.safeBlockHorizontal * 60,
          ),
          child: Text(
            "You have no muscle maps added. Add one to view it here",
            textAlign: TextAlign.center,
            style: Theme.of(context)
                .textTheme
                .bodyLarge!
                .copyWith(fontStyle: FontStyle.italic),
          ),
        ),
      );
    }
    return Container();
  }
}
