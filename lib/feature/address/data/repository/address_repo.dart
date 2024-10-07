
import '../../../../../core/common/shared/shared_imports.dart'; //


abstract class UserAddressRepository {
  Future<ApiResult<CreateAddressResponse>> createANewAddress(
      CreateAddressRequestBody createAddressRequestBody);

  Future<ApiResult<GetAddressResponse>> getAllAddress();

  Future<ApiResult<CreateAddressResponse>> updateAddress(
      String id, CreateAddressRequestBody createAddressRequestBody);

  Future<ApiResult<ApiSuccessGeneralModel>> removeAddress(String id);

  Future<ApiResult<CheckLocationAvailableResponse>> checkAddressAvailable(
      CheckAddressAvailableRequestBody checkAddressAvailableRequestBody);
}

class UserAddressRepositoryImplement implements UserAddressRepository {
  UserAddressRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<CreateAddressResponse>> createANewAddress(
      CreateAddressRequestBody createAddressRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.createAddress(
          createAddressRequestBody.toFilteredJson(),
        );
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
    } else {
          return ApiResult.failure(
          ApiErrorHandler.handle(AppStrings.pleaseCheckYourInternetConnection));
    }
  }

  @override
  Future<ApiResult<GetAddressResponse>> getAllAddress() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getAllAddress();
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
  Future<ApiResult<ApiSuccessGeneralModel>> removeAddress(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.deleteAddress(id);
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
  Future<ApiResult<CreateAddressResponse>> updateAddress(
      String id, CreateAddressRequestBody createAddressRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.updateAddress(
            id, createAddressRequestBody.toFilteredJson());
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
  Future<ApiResult<CheckLocationAvailableResponse>> checkAddressAvailable(
      CheckAddressAvailableRequestBody checkAddressAvailableRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService
            .checkAddressAvaliableService(checkAddressAvailableRequestBody);
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
