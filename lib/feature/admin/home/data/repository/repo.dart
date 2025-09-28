import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class AdminOrderRepository {
  Future<ApiResult<GetOrdersResponse>> getAllAdminOrderRepository(int status);


}

class OrderAdminRepositoryImplement implements AdminOrderRepository {
  OrderAdminRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<GetOrdersResponse>>
  getAllAdminOrderRepository(int status) async {
    try {
      final response = await _apiService.getAllAdminOrdersService(status);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }




}
