import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/bodyRequest/add_item.dart';
import '../model/response/add_item.dart';

abstract class CartRepository {
  Future<ApiResult<AddItemToCartResponse>> addItemToCart(
      AddItemToCartRequestBody addItemToCartRequestBody);
}

class CartRepositoryImplement implements CartRepository {
  CartRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<AddItemToCartResponse>> addItemToCart(
      AddItemToCartRequestBody addItemToCartRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.addItemToCart(addItemToCartRequestBody);
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
