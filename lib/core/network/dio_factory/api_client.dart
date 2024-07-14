import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../routing/routes.dart';
import '../../services/app_storage_key.dart';
import '../../services/shared_pref_helper.dart';
import '../api_constant/api_constant.dart';

class TokenInterceptor extends Interceptor {
  final Dio dio;
  final navigatorKey = GlobalKey<NavigatorState>();

  TokenInterceptor(this.dio);

  @override
  void onRequest(
      RequestOptions options, RequestInterceptorHandler handler) async {
    // Obtain the access token

    String? accessToken =
        await SharedPrefHelper.getSecuredString(PrefKeys.accessToken);

    if (accessToken != null) {
      // Add the access token to the Authorization header
      options.headers["Accept"] = "application/json";
      options.headers["Authorization"] = "Bearer $accessToken";
    }

    return handler.next(options); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Obtain the refresh token
      String? refreshToken =
          await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

      if (refreshToken != null) {
        try {
          // Request a new access token
          final response = await dio.post(
            ApiConstants.refreshToken,
            data: {'refreshToken': refreshToken},
          );

          final newAccessToken = response.data['accessToken'];

          // Save the new access token
          await SharedPrefHelper.setSecuredString(
              PrefKeys.accessToken, newAccessToken);

          // Retry the original request with the new access token
          err.requestOptions.headers["Authorization"] =
              "Bearer $newAccessToken";
          final opts = Options(
              method: err.requestOptions.method,
              headers: err.requestOptions.headers);
          final cloneReq = await dio.request(
            err.requestOptions.path,
            options: opts,
            data: err.requestOptions.data,
            queryParameters: err.requestOptions.queryParameters,
          );

          return handler.resolve(cloneReq);
        } catch (e) {
          // Refresh token is also expired or invalid, force re-login
          _showSessionExpiredMessage();
          return handler.reject(err);
        }
      } else {
        _showSessionExpiredMessage();
      }
    }

    // If the error is not related to token expiration, forward it
    return handler.next(err);
  }

  void _showSessionExpiredMessage() {
    // Show session expired message
    navigatorKey.currentState?.pushNamedAndRemoveUntil(
      Routes.loginRoute,
      (Route<dynamic> route) => false,
      arguments: 'Your session has expired. Please log in again.',
    );
  }
}