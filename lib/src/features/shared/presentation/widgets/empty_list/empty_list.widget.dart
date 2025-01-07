import 'package:fit_chrono/src/features/shared/presentation/widgets/full_screen_msg/full_screen_msg.widget.dart';
import 'package:fit_chrono/src/routing/router.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class EmptyListWidget extends StatelessWidget {
  const EmptyListWidget({
    super.key,
    required this.text,
    required this.buttonText,
    required this.targetPage,
    this.hideButton = false,
  });

  final String text;
  final String buttonText;
  final PAGES targetPage;
  final bool hideButton;

  @override
  Widget build(BuildContext context) {
    void onAdd() {
      context.push(targetPage.path);
    }

    return FullScreenMsgWidget(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          const SizedBox(
            height: 20,
          ),
          if (!hideButton)
            TextButton(
              onPressed: onAdd,
              child: Text(buttonText),
            ),
        ],
      ),
    );
  }
}
