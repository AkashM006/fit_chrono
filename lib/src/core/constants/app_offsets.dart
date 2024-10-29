import 'package:fit_chrono/src/core/constants/size.dart';
import 'package:flutter/material.dart';

class AppOffsets {
  static late BoxConstraints formWidthConstraint;
  static late EdgeInsets screenPadding;
  static late double maxFormWidth;
  static late double maxBodyWidth;

  static void init(BuildContext context) {
    formWidthConstraint = const BoxConstraints(maxWidth: 500);
    screenPadding = EdgeInsets.symmetric(
      vertical: SizeConfig.safeBlockVertical * 2,
      horizontal: SizeConfig.safeBlockHorizontal * 5,
    );
    maxFormWidth = SizeConfig.safeBlockHorizontal * 80 > 600
        ? 600
        : SizeConfig.safeBlockHorizontal * 80;
    maxBodyWidth = SizeConfig.safeBlockHorizontal * 60;
  }
}
