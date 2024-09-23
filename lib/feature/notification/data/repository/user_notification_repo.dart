import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/user_notification_resp.dart';

abstract class UserNotificationRepository {
  Future<ApiResult<UserNotificationResponse>> getAllUserNotificationRepo();
  Future<ApiResult<UserNotificationResponse>> updateAllUserNotificationToSeenRepo();
}

class UserNotificationRepositoryImplement
    implements UserNotificationRepository {
  UserNotificationRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<UserNotificationResponse>>
      getAllUserNotificationRepo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getAllNotificationToUserService();
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(DataSource.noInternetConnection.getFailure());
    }
  }
  
  @override
  Future<ApiResult<UserNotificationResponse>> updateAllUserNotificationToSeenRepo() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.updateAllNotificationToSeenService();
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
