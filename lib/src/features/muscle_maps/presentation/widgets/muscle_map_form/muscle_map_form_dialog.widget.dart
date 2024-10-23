import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class MuscleMapFormDialogWidget extends StatelessWidget {
  const MuscleMapFormDialogWidget({
    super.key,
    required this.isEditMode,
  });

  final bool isEditMode;

  @override
  Widget build(BuildContext context) {
    void handleCancel() {
      context.pop();
    }

    void handleDiscard() {
      context.pop();
      context.pop();
    }

    return AlertDialog(
      title: const Text("Unsaved Changes"),
      content: const Text(
        "It looks like you’ve made some changes to your muscle map. Are you sure you want to exit without saving? Your updates will be lost if you leave now.",
      ),
      actions: [
        TextButton(
          onPressed: handleCancel,
          child: const Text("Cancel"),
        ),
        TextButton(
          onPressed: handleDiscard,
          child: const Text("Discard"),
        )
      ],
    );
  }
}
