import 'package:fit_chrono/src/features/muscle_maps/presentation/dto/muscle_map.dto.dart';
import 'package:fit_chrono/src/features/shared/presentation/widgets/empty_list/empty_list.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuscleMapsListWidget extends StatelessWidget {
  const MuscleMapsListWidget({
    super.key,
    required this.muscleMaps,
  });

  final List<MuscleMapDto> muscleMaps;

  @override
  Widget build(BuildContext context) {
    if (muscleMaps.isEmpty) {
      return const Center(
        child: EmptyListWidget(
          text: "You have no muscle maps added. Add one to view it here",
        ),
      );
    }

    void onMuscleMapTapped(int id) {
      context.pushNamed(PAGES.muscleMapDetail.name, queryParameters: {
        'id': id.toString(),
      });
    }

    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        title: Text(muscleMaps[index].name),
        onTap: () => onMuscleMapTapped(muscleMaps[index].id),
        trailing: const Icon(Icons.arrow_right),
      ),
      itemCount: muscleMaps.length,
    );
  }
}
