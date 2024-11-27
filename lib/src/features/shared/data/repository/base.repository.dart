import 'package:fit_chrono/src/core/utils/custom_error.util.dart';
import 'package:fit_chrono/src/core/utils/data_state.util.dart';

abstract class BaseRepository {
  const BaseRepository();
  Future<DataState<T>> safeExecute<T>(Future<T> Function() callback) async {
    try {
      final result = await callback();
      return DataSuccess(result);
    } catch (e) {
      final error = e as CustomError;
      return DataFailure(error);
    }
  }
}
