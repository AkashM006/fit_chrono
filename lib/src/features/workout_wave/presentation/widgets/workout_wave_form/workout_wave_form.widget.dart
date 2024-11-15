import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WorkoutWaveFormWidget extends ConsumerStatefulWidget {
  const WorkoutWaveFormWidget({super.key});

  @override
  ConsumerState<WorkoutWaveFormWidget> createState() =>
      _WorkoutWaveFormWidgetState();
}

class _WorkoutWaveFormWidgetState extends ConsumerState<WorkoutWaveFormWidget> {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: Form(
        key: _formKey,
        child: Column(
          children: [
            TextFormField(
              decoration: const InputDecoration(
                label: Text("Workout Wave Name"),
              ),
            )
          ],
        ),
      ),
    );
  }
}
