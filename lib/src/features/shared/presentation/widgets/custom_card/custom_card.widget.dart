import 'package:fit_chrono/src/core/constants/app_offsets.dart';
import 'package:flutter/material.dart';

class CustomCardWidget extends StatelessWidget {
  const CustomCardWidget({
    super.key,
    this.onTap,
    this.child,
  });

  final void Function()? onTap;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    final cardBorderRadius = AppOffsets.cardBorderRadius;

    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: cardBorderRadius,
      ),
      child: InkWell(
        borderRadius: cardBorderRadius,
        onTap: onTap,
        child: child,
      ),
    );
  }
}
