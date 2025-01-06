import 'package:flutter/material.dart';

class CustomListTileWithActionsWidget extends StatelessWidget {
  const CustomListTileWithActionsWidget({
    super.key,
    required this.body,
    required this.actions,
  });

  final Widget body;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            body,
            Row(children: actions),
          ],
        ),
      );
}
