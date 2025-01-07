import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class FullScreenMsgWidget extends StatelessWidget {
  const FullScreenMsgWidget({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ConstrainedBox(
        constraints: AppOffsets.messageWidthConstaint,
        child: child,
      ),
    );
  }
}
