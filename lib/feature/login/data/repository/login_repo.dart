// import 'package:altayer/core/network/api/app_api.dart';
// import 'package:altayer/core/network/apiResult/api_reuslt.dart';
// import 'package:altayer/core/network/error_handler/api_error_handler.dart';
// import 'package:altayer/core/network/network_connectivity/connectivity_controller.dart';
// import 'package:altayer/feature/login/data/model/bodyRequest/login_body_request.dart';
// import 'package:altayer/feature/login/data/model/loginResponse/login_response.dart';

// class LoginRepository {
//   LoginRepository(this._apiService, this._networkInfo);
//   final AppServiceClient _apiService;
//   late final NetworkInfo _networkInfo;

//   Future<ApiResult<LoginResponse>> login(
//     LoginRequestBody loginRequestBody,
//   ) async {
//     if (await _networkInfo.isConnected) {
//       try {
//         final response = await _apiService.login(loginRequestBody);
//         return ApiResult.success(response);
//       } catch (error) {
//         return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
//       }
//     } else {
//       //return  internet connection error
//       return ApiResult.failure(DataSource.noInternetConnection.getFailure());
//     }
//   }
// }
