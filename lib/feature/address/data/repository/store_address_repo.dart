import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/response/get_store_address_response.dart';

abstract class StoreAddressRepository {
  // Future<ApiResult<CreateAddressResponse>> createANewAddress(
  //     CreateAddressRequestBody createAddressRequestBody);

  Future<ApiResult<GetStoreAddressResponse>> getAllStoreAddress();

  // Future<ApiResult<CreateAddressResponse>> updateAddress(
  //     String id, CreateAddressRequestBody createAddressRequestBody);

  // Future<ApiResult<ApiSuccessGeneralModel>> removeAddress(String id);
}

class StoreAddressRepositoryImplement implements StoreAddressRepository {
  StoreAddressRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;
  
  @override
  Future<ApiResult<GetStoreAddressResponse>> getAllStoreAddress() async{
      if (await _networkInfo.isConnected) {
        try {
          final response = await _apiService.getAllStoreBranch();
          return ApiResult.success(response);
        } catch (error) {
          return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
        }
      } else {
        //return  internet connection error
        return ApiResult.failure(DataSource.noInternetConnection.getFailure());
      }
  }

  // @override
  // Future<ApiResult<CreateAddressResponse>> createANewAddress(
  //     CreateAddressRequestBody createAddressRequestBody) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response =
  //           await _apiService.createAddress(createAddressRequestBody);
  //       return ApiResult.success(response);
  //     } catch (error) {
  //       return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
  //     }
  //   } else {
  //     //return  internet connection error
  //     return ApiResult.failure(DataSource.noInternetConnection.getFailure());
  //   }
  // }

  // @override
  // Future<ApiResult<GetAddressResponse>> getAllAddress() async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _apiService.getAllAddress();
  //       return ApiResult.success(response);
  //     } catch (error) {
  //       return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
  //     }
  //   } else {
  //     //return  internet connection error
  //     return ApiResult.failure(DataSource.noInternetConnection.getFailure());
  //   }
  // }

  // @override
  // Future<ApiResult<ApiSuccessGeneralModel>> removeAddress(String id) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response = await _apiService.deleteAddress(id);
  //       return ApiResult.success(response);
  //     } catch (error) {
  //       return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
  //     }
  //   } else {
  //     //return  internet connection error
  //     return ApiResult.failure(DataSource.noInternetConnection.getFailure());
  //   }
  // }

  // @override
  // Future<ApiResult<CreateAddressResponse>> updateAddress(
  //     String id, CreateAddressRequestBody createAddressRequestBody) async {
  //   if (await _networkInfo.isConnected) {
  //     try {
  //       final response =
  //           await _apiService.updateAddress(id, createAddressRequestBody);
  //       return ApiResult.success(response);
  //     } catch (error) {
  //       return ApiResult.failure(ErrorHandler.handle(error).apiErrorModel);
  //     }
  //   } else {
  //     //return  internet connection error
  //     return ApiResult.failure(DataSource.noInternetConnection.getFailure());
  //   }
  // }
}
