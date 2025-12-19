import 'package:elminiawy/core/common/shared/shared_imports.dart';
import 'package:elminiawy/feature/admin/coupons/data/model/coupons_response.dart';

abstract class CouponsRepository {
  Future<ApiResult<CouponsResponse>> getAllCouponsRepo();
  Future<ApiResult<CouponsResponse>> updateCouponRepo({
    String? id,
    String? title,
    String? discount,
    String? expire,
  });
  Future<ApiResult<ApiSuccessGeneralModel>> deleteCouponsRepo({String? id});

  Future<ApiResult<CouponsResponse>> addCouponsRepo({
    String? title,
    String? discount,
    String? expire,
  });
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

  @override
  Future<ApiResult<ApiSuccessGeneralModel>> deleteCouponsRepo({
    String? id,
  }) async {
    try {
      final response = await _apiService.deleteCouponService(id!);
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CouponsResponse>> updateCouponRepo({
    String? id,
    String? title,
    String? discount,
    String? expire,
  }) async {
    try {
      final response = await _apiService.updateCouponService(
        id!,
        title,
        discount,
        expire,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }

  @override
  Future<ApiResult<CouponsResponse>> addCouponsRepo({
    String? title,
    String? discount,
    String? expire,
  }) async {
    try {
      final response = await _apiService.addCouponService(
        title,
        discount,
        expire,
      );
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ApiErrorHandler.handle(error));
    }
  }
}
