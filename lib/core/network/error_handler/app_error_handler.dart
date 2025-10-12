import 'package:flutter/foundation.dart';

class AppErrorHandler {
  static void init() {
    FlutterError.onError = (FlutterErrorDetails details) {
      if (_isEmitAfterClose(details.exception)) {
        if (kDebugMode) {
          debugPrint('⚠️ تم تجاهل خطأ emit بعد close (FlutterError handler)');
        }
        return;
      }
      FlutterError.presentError(details);
    };

    PlatformDispatcher.instance.onError = (error, stack) {
      if (_isEmitAfterClose(error)) {
        if (kDebugMode) {
          debugPrint('⚠️ تم تجاهل خطأ emit بعد close (PlatformDispatcher)');
        }
        return true;
      }
      return false;
    };
  }

  static bool _isEmitAfterClose(Object error) {
    return error
        .toString()
        .contains('Cannot emit new states after calling close');
  }
}
