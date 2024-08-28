import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/request/update_account_information.dart';
import '../model/response/delete_account.dart';
import '../model/response/update_account_information.dart';

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
        return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
      }
    } else {
      //return  internet connection error
      return ApiResult.failure(DataSource.noInternetConnection.getFailure());
    }
  }

  @override
  Future<ApiResult<DeleteAccountResponse>> deleteAccountRepo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.deleteMyAccountService();
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
