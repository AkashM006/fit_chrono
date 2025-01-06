String getFormattedTimeFromDuration(Duration duration) =>
    '${duration.inMinutes.toString().padLeft(2, '0')}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';

extension StringExtension on String {
  String capitalize() =>
      "${this[0].toUpperCase()}${substring(1).toLowerCase()}";
}

extension DurationExtension on Duration {
  String formattedTime() => getFormattedTimeFromDuration(this);
}

extension IntExtension on int {
  String formattedTime() {
    final duration = Duration(seconds: this);
    return getFormattedTimeFromDuration(duration);
  }
}
