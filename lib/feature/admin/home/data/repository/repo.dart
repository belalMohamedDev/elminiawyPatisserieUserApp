import 'package:elminiawy/feature/admin/home/data/model/response/get_order_count_status.dart';

import '../../../../../core/common/shared/shared_imports.dart'; //

abstract class AdminOrderRepository {
  Future<ApiResult<GetOrdersResponse>> getAllAdminOrderRepository(int status);
  Future<ApiResult<OrderResponse>> updateAdminOrderStatusRepository(
      {required String id,
      String? adminAcceptedAt,
      String? adminCompletedAt,
      String? canceledAt,
      String? driverDeliveredAt,
      required int status});
  Future<ApiResult<GetOrderStatusCountResponse>>
      getOrdersStatusAndSalesTodayCountRepository();
}

class OrderAdminRepositoryImplement implements AdminOrderRepository {
  OrderAdminRepositoryImplement(this._apiService);
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<GetOrdersResponse>> getAllAdminOrderRepository(
      int status) async {
    try {
      final response = await _apiService.getAllAdminOrdersService(status);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<GetOrderStatusCountResponse>>
      getOrdersStatusAndSalesTodayCountRepository() async {
    try {
      final response =
          await _apiService.getOrdersStatusAndSalesTodayCountService();

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<OrderResponse>> updateAdminOrderStatusRepository(
      {required String id,
      String? adminAcceptedAt,
      String? adminCompletedAt,
      String? canceledAt,
      String? driverDeliveredAt,
      required int status}) async {
    try {
      final response = await _apiService.updateAdminStatusOrdersService(
          id,
          adminAcceptedAt,
          adminCompletedAt,
          canceledAt,
          driverDeliveredAt,
          status);

      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
