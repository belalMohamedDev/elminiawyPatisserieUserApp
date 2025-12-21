import 'package:elminiawy/feature/admin/storeAddress/data/model/create_store_address_request.dart';
import 'package:elminiawy/feature/admin/storeAddress/data/model/store_address_response.dart';

import '../../../../../core/common/shared/shared_imports.dart';

abstract class BranchStoreAddressRepository {
  Future<ApiResult<BranchStoreAddressResponse>> getAllBranchStoreAddreesRepo();
  Future<ApiResult<BranchStoreAddressResponse>> createNewBranchStoreAddreesRepo(
    CreateStoreNewAddress createStoreNewAddress,
  );
}

class BranchStoreAddressRepositoryImplement
    implements BranchStoreAddressRepository {
  BranchStoreAddressRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<BranchStoreAddressResponse>>
  getAllBranchStoreAddreesRepo() async {
    try {
      final response = await _apiService.getAllBranchStoreAddressService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<BranchStoreAddressResponse>> createNewBranchStoreAddreesRepo(
    CreateStoreNewAddress createStoreNewAddress,
  ) async{
    try {
      final response = await _apiService.createNewBrancheAddress(createStoreNewAddress);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
