import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class AdminOrderRepository {
  Future<ApiResult<GetOrdersResponse>> getAllOrderPendingToAdminRepository();
  Future<ApiResult<GetOrdersResponse>> getAllOrderCompleteToAdminRepository();
}

class OrderAdminRepositoryImplement implements AdminOrderRepository {
  OrderAdminRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<GetOrdersResponse>>
      getAllOrderPendingToAdminRepository() async {
    try {
      final response = await _apiService.getAllPendingOrdersToAdminService();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<GetOrdersResponse>>
      getAllOrderCompleteToAdminRepository() async {
    try {
      final response = await _apiService.getAllCompleteOrdersToAdminService();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
