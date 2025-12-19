import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';

abstract class CouponsRepository {
  Future<ApiResult<CouponsResponse>> getAllCouponsRepo();
}

class CouponsRepositoryImplement implements CouponsRepository {
  CouponsRepositoryImplement(this._apiService);

  final AppServiceClient _apiService;

  @override
  Future<ApiResult<CouponsResponse>> getAllCouponsRepo() async {
    try {
      final response = await _apiService.getAllCouponsService();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
