import 'package:elminiawy/feature/order/data/model/requestBody/create_order_request.dart';
import 'package:elminiawy/feature/order/data/model/response/create_order.dart';

import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/response/get_order.dart';

abstract class OrderRepository {
  Future<ApiResult<CreateOrderResponse>> createCashOrder(
      CreateOrderRequestBody createOrderRequestBody);

  Future<ApiResult<CreateOrderResponse>> orderCancelledRepository(String id);


  Future<ApiResult<GetOrdersResponse>> getAllOrderCompleteRepository();
  Future<ApiResult<GetOrdersResponse>> getAllOrderPendingRepository();
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
  
  @override
  Future<ApiResult<GetOrdersResponse>> getAllOrderCompleteRepository() async{
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getAllOrderCompleteService();
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
  Future<ApiResult<GetOrdersResponse>> getAllOrderPendingRepository() async {
     if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getAllOrderPendingService();
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
