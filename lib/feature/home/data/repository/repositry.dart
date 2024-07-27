import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';

import '../model/response/banner_response.dart';
import '../model/response/category_response.dart';
import '../model/response/product_response.dart';

abstract class HomeRepository {
  Future<ApiResult<BannerResponse>> getBanner();
  Future<ApiResult<CategoryResponse>> getCategories(String sort);
  Future<ApiResult<ProductResponse>> getNewProduct(
      int? limit, String? sort, String? keyword);
}

class HomeRepositoryImplement implements HomeRepository {
  HomeRepositoryImplement(this._networkInfo, this._apiService);

  final NetworkInfo _networkInfo;
  final AppServiceClient _apiService;

  @override
  Future<ApiResult<BannerResponse>> getBanner() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getBanners();
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
  Future<ApiResult<CategoryResponse>> getCategories(String sort) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getCategories(sort);
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
  Future<ApiResult<ProductResponse>> getNewProduct(
      int? limit, String? sort, String? keyword) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _apiService.getProduct(limit, sort, keyword);
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
