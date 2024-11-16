import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatelessWidget {
  const FormContainerWidget({
    super.key,
    this.isScroll = true,
    required this.children,
  });

  final List<Widget> children;
  final bool isScroll;

  @override
  Widget build(BuildContext context) {
    final constrainedBox = ConstrainedBox(
      constraints: AppOffsets.formWidthConstraint,
      child: Column(
        children: children,
      ),
    );

    return isScroll
        ? SingleChildScrollView(
            padding: AppOffsets.screenPadding,
            child: constrainedBox,
          )
        : Padding(
            padding: AppOffsets.screenPadding,
            child: constrainedBox,
          );
  }
}
