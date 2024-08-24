import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../response/product_category.dart';

class GetProductBasedOnCategoryRepository {
  GetProductBasedOnCategoryRepository(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  Future<ApiResult<GetProductsBasedOnCategory>> getProductBasedOnCategory(
      String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getProductsBasedOnCategory(id);
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