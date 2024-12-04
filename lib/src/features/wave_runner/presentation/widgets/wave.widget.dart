import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:flutter/material.dart';

class WaveWidget extends StatefulWidget {
  const WaveWidget({
    super.key,
    required this.workoutWithMeasureDto,
  });

  final WorkoutWithMeasureDto workoutWithMeasureDto;

  @override
  State<WaveWidget> createState() => _WaveWidgetState();
}

class _WaveWidgetState extends State<WaveWidget> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        widget.workoutWithMeasureDto.workout.name,
      ),
    );
  }
}
