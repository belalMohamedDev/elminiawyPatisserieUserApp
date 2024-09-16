import 'package:elminiawy/feature/payment/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/payment/data/model/response/create_order.dart';

import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';

abstract class OrderRepository {
  Future<ApiResult<CreateOrderResponse>> createCashOrder(
      CreateOrderRequestBody createOrderRequestBody);

  Future<ApiResult<CreateOrderResponse>> orderCancelledRepository(String id);
}

class OrderRepositoryImplement implements OrderRepository {
  OrderRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<CreateOrderResponse>> createCashOrder(
      CreateOrderRequestBody createOrderRequestBody) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.createCashOrderService(createOrderRequestBody);
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
  Future<ApiResult<CreateOrderResponse>> orderCancelledRepository(
      String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.orderCancellService(id);
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
