import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class FormContainerWidget extends StatelessWidget {
  const FormContainerWidget({
    super.key,
    required this.children,
  });

  final List<Widget> children;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: AppOffsets.screenPadding,
      child: ConstrainedBox(
        constraints: AppOffsets.formWidthConstraint,
        child: Column(
          children: children,
        ),
      ),
    );
  }
}
