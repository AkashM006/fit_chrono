import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UnsavedFormDialogWidget extends StatelessWidget {
  const UnsavedFormDialogWidget({
    super.key,
    required this.item,
  });

  final String item;

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
      content: Text(
        "It looks like you've made some changes to your $item. Are you sure you want to exit without saving? Your edits will be lost if you leave now.",
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
