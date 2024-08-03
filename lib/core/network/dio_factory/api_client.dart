import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../common/toast/show_toast.dart';
import '../../routing/routes.dart';
import '../../services/app_storage_key.dart';
import '../../services/shared_pref_helper.dart';
import '../../style/fonts/strings_manger.dart';
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

    // Add the access token to the Authorization header
    options.headers["Accept"] = "application/json";
    options.headers["Authorization"] = "Bearer $accessToken";

    return handler.next(options); // continue
  }

  @override
  void onError(DioException err, ErrorInterceptorHandler handler) async {
    if (err.response?.statusCode == 401) {
      // Obtain the refresh token
      String? refreshToken =
          await SharedPrefHelper.getSecuredString(PrefKeys.refreshToken);

      try {
        // Request a new access token
        final response = await dio.post(
          ApiConstants.refreshToken,
          data: {'refreshToken': refreshToken},
          options: Options(headers: {"Content-Type": "application/json"}),
        );

        final newAccessToken = response.data['accessToken'];

        // Save the new access token
        await SharedPrefHelper.setSecuredString(
            PrefKeys.accessToken, newAccessToken);

        // Retry the original request with the new access token
        err.requestOptions.headers["Authorization"] = "Bearer $newAccessToken";
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
    }

    // If the error is not related to token expiration, forward it
    _showErrorMessage(err.message!);
    return handler.next(err);
  }

  void _showSessionExpiredMessage() {
    final context = navigatorKey.currentState?.context;

    if (context != null) {
      ShowToast.showToastErrorTop(
          errorMessage: AppStrings.sessionExpired, context: context);

      // Show session expired message
      navigatorKey.currentState?.pushNamedAndRemoveUntil(
        Routes.loginRoute,
        (Route<dynamic> route) => false,
        arguments: AppStrings.sessionExpired,
      );
    }
  }

  void _showErrorMessage(String error) {
    final context = navigatorKey.currentState?.context;

    if (context != null) {
      ShowToast.showToastErrorTop(errorMessage: error, context: context);
    }
  }
}
