part of 'exception.dart';

extension ExceptionExtension on Exception {
  AppFailure toAppFailure() {
    return (this is CustomException)
        ? AppFailure(
            code: (this as CustomException).code,
            msg: (this as CustomException).msg)
        : AppFailure(msg: toString());
  }
}
