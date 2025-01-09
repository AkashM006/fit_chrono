import 'package:fit_chrono/src/core/utils/formatter.util.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

final DateFormat dateFormatter = DateFormat('dd-MMM-yyyy');

extension ThemeContextExtension on BuildContext {
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
}

extension StringExtension on String {
  String get capitalize =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

extension DurationExtension on Duration {
  String get formattedTime => getFormattedTimeFromDuration(this);
}

extension IntExtension on int {
  String get formattedTime =>
      getFormattedTimeFromDuration(Duration(seconds: this));
}

extension DateTimeExtension on DateTime {
  String get formattedDate => dateFormatter.format(this);
}
