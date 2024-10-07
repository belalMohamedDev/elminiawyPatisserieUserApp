

import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class UserNotificationRepository {
  Future<ApiResult<UserNotificationResponse>> getAllUserNotificationRepo();
  Future<ApiResult<UserNotificationResponse>>
      updateAllUserNotificationToSeenRepo();
  Future<ApiResult<UserNotificationResponse>> deleteUserNotificationRepo(
      String id);
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
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
         return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));
    }
  }

  @override
  Future<ApiResult<UserNotificationResponse>>
      updateAllUserNotificationToSeenRepo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.updateAllNotificationToSeenService();
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));    }
  }

  @override
  Future<ApiResult<UserNotificationResponse>> deleteUserNotificationRepo(
      String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.deleteUserNotificationService(id);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
      //return  internet connection error
          return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));
    }
  }
}
