import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class WishListRepository {
  Future<ApiResult<ProductResponse>> addOrRemoveProductFromWishList(
      String product);

  Future<ApiResult<ProductResponse>> getWishList();
}

class WishListRepositoryImplement implements WishListRepository {
  WishListRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;


  @override
  Future<ApiResult<ProductResponse>> addOrRemoveProductFromWishList(
      String product) async {

      try {
        final response =
            await _apiService.addOrRemoveProductFromWishListService(product);
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }

  }

  @override
  Future<ApiResult<ProductResponse>> getWishList() async {

      try {
        final response = await _apiService.getWishListService();
        return ApiResult.success(response);
      } catch (error) {
        return ApiResult.failure(ApiErrorHandler.handle(error));
      }
  
  }


}
