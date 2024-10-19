import 'package:flutter/material.dart';

class MuscleMapFormWidget extends StatefulWidget {
  const MuscleMapFormWidget({super.key});

  @override
  State<MuscleMapFormWidget> createState() => _MuscleMapFormWidgetState();
}

class _MuscleMapFormWidgetState extends State<MuscleMapFormWidget> {
  late TextEditingController _nameController;

  void handleSubmit() {
    // todo: handle form submit, loading and error states
  }

  @override
  void initState() {
    super.initState();
    _nameController = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          controller: _nameController,
          decoration: const InputDecoration(
            border: InputBorder.none,
            label: Text("Enter Name"),
          ),
          maxLength: 24,
        ),
        FilledButton(
          onPressed: handleSubmit,
          child: const Text("Go"),
        )
      ],
    );
  }
}
