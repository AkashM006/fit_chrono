import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class AppOffsets {
  static late BoxConstraints formWidthConstraint;
  static late EdgeInsets screenPadding;

  static void init(BuildContext context) {
    formWidthConstraint = const BoxConstraints(maxWidth: 500);
    screenPadding = EdgeInsets.symmetric(
      vertical: SizeConfig.safeBlockVertical * 2,
      horizontal: SizeConfig.safeBlockHorizontal * 5,
    );
  }
}
