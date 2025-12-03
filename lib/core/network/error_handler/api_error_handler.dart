import '../../../../../core/common/shared/shared_imports.dart';

class ApiErrorHandler {
  static ApiErrorModel handle(dynamic error) {
    if (error is DioException) {
      final status = error.response?.statusCode;
      final data = error.response?.data;

      switch (error.type) {
        case DioExceptionType.connectionTimeout:
          return ApiErrorModel(message: "Connection timeout with server");

        case DioExceptionType.sendTimeout:
          return ApiErrorModel(message: "Send timeout with server");

        case DioExceptionType.receiveTimeout:
          return ApiErrorModel(message: "Receive timeout with server");

        case DioExceptionType.badResponse:
          return _parseServerError(status, data);

        case DioExceptionType.cancel:
          return ApiErrorModel(message: "Request was cancelled");

        case DioExceptionType.connectionError:
          return ApiErrorModel(message: "No internet connection");

        default:
          return ApiErrorModel(message: "Unexpected error occurred");
      }
    } else {
      return ApiErrorModel(message: "Unexpected error occurred");
    }
  }

  /// Parse server error body (400–500)
  static ApiErrorModel _parseServerError(int? statusCode, dynamic data) {
    String message = "Unknown server error";

    if (data != null) {
      try {
        if (data is String) {
          message = data; // API returns raw text
        }

        if (data is Map) {
          // Common message keys
          if (data.containsKey('message')) {
            message = data['message'];
          } else if (data.containsKey('error')) {
            message = data['error'];
          } else if (data.containsKey('errors')) {
            // validation errors array
            if (data['errors'] is List && data['errors'].isNotEmpty) {
              message = data['errors'][0].toString();
            }
          }
        }
      } catch (_) {}
    }

    return ApiErrorModel(message: message, statusCode: statusCode);
  }
}
