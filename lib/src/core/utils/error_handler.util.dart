import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/error_msg.util.dart';

Future<T> handleError<T>(
  Future<T> Function() operation,
  String somethingWentWrongMsgAction,
) async {
  try {
    return await operation();
  } catch (e) {
    if (e is AppError) rethrow;
    final errorMsg = somethingWentWrongMsg(somethingWentWrongMsgAction);
    throw AppError(message: errorMsg);
  }
}
