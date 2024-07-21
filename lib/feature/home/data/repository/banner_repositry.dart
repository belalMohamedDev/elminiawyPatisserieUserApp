import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../dataSource/local/banner_local.dart';
import '../dataSource/remote/remote_data_source.dart';
import '../response/banner_response.dart';

class BannerRepository {
  BannerRepository(this._homeRemoteDataSource, this._bannerLocalDataSource,
      this._networkInfo);

  final HomeRemoteDataSource _homeRemoteDataSource;
  final BannerLocalDataSource _bannerLocalDataSource;
  final NetworkInfo _networkInfo;

  Future<ApiResult<BannerResponse>> getBanner() async {
    try {
      // Attempt to fetch data from local data source
      final response = await _bannerLocalDataSource.getBanners();
      debugPrint('Banner data retrieved from local data source: $response');
      return ApiResult.success(response);
    } catch (localError) {
      // If local data retrieval fails
      debugPrint('Local data source error: $localError');

      // Check if the device is connected to the internet
      if (await _networkInfo.isConnected) {
        try {
          // Attempt to fetch data from remote data source
          final response = await _homeRemoteDataSource.banner();
          debugPrint(
              'Banner data retrieved from remote data source: $response');

          if (response.data != null) {
            // Save response to local cache
            await _bannerLocalDataSource.saveBannesToCache(response);
            return ApiResult.success(response);
          } else {
            // Handle case where response data is null
            return ApiResult.failure(
                ErrorHandler.handle(DioExceptionType.unknown).apiErrorModel);
          }
        } catch (remoteError) {
          // Handle errors from remote data source
          debugPrint('Remote data source error: $remoteError');
          return ApiResult.failure(
              ErrorHandler.handle(remoteError).apiErrorModel);
        }
      } else {
        // Handle no internet connection error
        debugPrint('No internet connection');
        return ApiResult.failure(DataSource.noInternetConnection.getFailure());
      }
    }
  }
}
