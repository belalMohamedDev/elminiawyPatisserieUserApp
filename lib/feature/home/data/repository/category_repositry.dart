import 'package:elminiawy/feature/home/data/response/category_response.dart';

import '../../../../core/network/api/app_api.dart';
import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';

class CategoryRepository {
  CategoryRepository(this._networkInfo, this._apiService);

  final NetworkInfo _networkInfo;
  final AppServiceClient _apiService;

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
}
