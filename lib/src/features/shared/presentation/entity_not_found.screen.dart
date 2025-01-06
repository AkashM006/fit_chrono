import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class EntityNotFoundScreen extends StatelessWidget {
  const EntityNotFoundScreen({
    super.key,
    required this.title,
    required this.content,
    required this.actions,
    this.appBarTitle = "Uh-oh!",
  });

  final String appBarTitle;
  final String title;
  final String content;
  final List<Widget> actions;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(appBarTitle),
        ),
        body: Center(
          child: ConstrainedBox(
            constraints: AppOffsets.messageWidthConstaint,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  content,
                  style: Theme.of(context).textTheme.bodyLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: actions,
                ),
              ],
            ),
          ),
        ),
      );
}
