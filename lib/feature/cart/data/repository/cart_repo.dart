import 'package:elminiawy/feature/cart/data/model/response/get_cart.dart';

import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../model/bodyRequest/add_item.dart';

abstract class CartRepository {
  Future<ApiResult<CartResponse>> addItemToCart(
      AddItemToCartRequestBody addItemToCartRequestBody);

  Future<ApiResult<CartResponse>> getCartItem();

  Future<ApiResult<CartResponse>> removeItemFromCart(String id);

  Future<ApiResult<CartResponse>> updateItemQuantityFromCart(
    String id,
    int quantity,
  );

  Future<ApiResult<CartResponse>> applyCouponToCart(String coupon);

  Future<ApiResult<CartResponse>> removeCartRepo();
}

class CartRepositoryImplement implements CartRepository {
  CartRepositoryImplement(this._apiService, this._networkInfo);
  final AppServiceClient _apiService;
  late final NetworkInfo _networkInfo;

  @override
  Future<ApiResult<CartResponse>> addItemToCart(
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

  @override
  Future<ApiResult<CartResponse>> getCartItem() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getCartItem();
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
  Future<ApiResult<CartResponse>> removeItemFromCart(String id) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.removeItemFromCart(id);
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
  Future<ApiResult<CartResponse>> updateItemQuantityFromCart(
      String id, int quantity) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _apiService.updateItemQuantityFromCart(id, quantity);
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
  Future<ApiResult<CartResponse>> applyCouponToCart(String coupon) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.applyCouponToCart(coupon);
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
  Future<ApiResult<CartResponse>> removeCartRepo() async{
     if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.deleteCartService();
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
