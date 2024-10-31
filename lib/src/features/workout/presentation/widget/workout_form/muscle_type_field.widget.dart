import 'package:fit_chrono/src/features/workout/presentation/dto/workout.dto.dart';
import 'package:flutter/material.dart';

class MuscleTypeField extends StatelessWidget {
  const MuscleTypeField({
    super.key,
    required this.value,
    required this.onChanged,
  });

  final WorkoutMeasureDto value;
  final void Function(WorkoutMeasureDto? selected) onChanged;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 1,
      child: DropdownButtonFormField<WorkoutMeasureDto>(
        decoration: const InputDecoration(
          border: InputBorder.none,
        ),
        value: value,
        items: const [
          DropdownMenuItem(
            value: WorkoutMeasureDto.reps,
            child: Text("Reps"),
          ),
          DropdownMenuItem(
            value: WorkoutMeasureDto.time,
            child: Text("Time"),
          ),
        ],
        onChanged: onChanged,
      ),
    );
  }
}
