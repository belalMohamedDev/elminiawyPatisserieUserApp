import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class AccountInformationRepository {
  Future<ApiResult<UpdateAccountInformationResponse>> updateAccountInformation(
      UpdateAccountInformationRequestBody updateAccountInformationRequestBody);

  Future<ApiResult<DeleteAccountResponse>> deleteAccountRepo();
}

class AccountInformationRepositoryImplement
    implements AccountInformationRepository {
  AccountInformationRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<UpdateAccountInformationResponse>> updateAccountInformation(
      UpdateAccountInformationRequestBody
          updateAccountInformationRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.updateMyData(updateAccountInformationRequestBody);
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
  Future<ApiResult<DeleteAccountResponse>> deleteAccountRepo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.deleteMyAccountService();
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
