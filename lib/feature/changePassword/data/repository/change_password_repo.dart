import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/request/change_my_password_request.dart';
import '../model/response/change_my_password_response.dart';

class ChangeMyPasswordRepository {
  ChangeMyPasswordRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<UpdateMyPasswordResponse>> changeMypasswordRepo(
    ChangeMyPasswordRequestBody changeMyPasswordRequestBody,
  ) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService
            .updateMyPasswordService(changeMyPasswordRequestBody);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(DataSource.noInternetConnection.getFailure());
    }
  }
}
