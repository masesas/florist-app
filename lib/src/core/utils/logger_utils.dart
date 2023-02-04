import 'package:flutter/foundation.dart';
import 'package:logger/logger.dart';

class LoggerUtils {
  static Logger? _logger;

  static void _instance() async {
    _logger ??= Logger(
      printer: PrettyPrinter(),
    );
  }

  static void print(
    dynamic obj, {
    bool isError = false,
  }) {
    if (kDebugMode) {
      _instance();
      if (isError) {
        _logger!.e(obj);
      } else {
        _logger!.d(obj);
      }
    }
  }

  static void printInfo(dynamic obj) {
    if (kDebugMode) {
      try {
        _instance();
        Logger().i(obj);
      } catch (e) {
        Logger(
            printer: PrettyPrinter(
          colors: false,
        )).d("error " + e.toString());
      }
    }
  }
}
