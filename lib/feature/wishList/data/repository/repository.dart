import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/getWishListResponse/response.dart';

abstract class WishListRepository {
  Future<ApiResult<WishListProduct>> addOrRemoveProductFromWishList(
      String product);

  Future<ApiResult<WishListProduct>> getWishList();
}

class WishListRepositoryImplement implements WishListRepository {
  WishListRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<WishListProduct>> addOrRemoveProductFromWishList(
      String product) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.addOrRemoveProductFromWishList(product);
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
  Future<ApiResult<WishListProduct>> getWishList() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getWishList();
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
