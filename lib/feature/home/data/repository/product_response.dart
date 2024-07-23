import 'package:dio/dio.dart';
import 'package:elminiawy/feature/home/data/dataSource/local/product_local.dart';
import 'package:elminiawy/feature/home/data/response/product_response.dart';
import 'package:flutter/material.dart';

import '../../../../core/network/apiResult/api_reuslt.dart';
import '../../../../core/network/error_handler/api_error_handler.dart';
import '../../../../core/network/network_connectivity/connectivity_controller.dart';
import '../dataSource/remote/remote_data_source.dart';

class ProductRepository {
  ProductRepository(this._homeRemoteDataSource, this._productLocalDataSource,
      this._networkInfo);

  final HomeRemoteDataSource _homeRemoteDataSource;
  final ProductLocalDataSource _productLocalDataSource;
  final NetworkInfo _networkInfo;

  Future<ApiResult<ProductResponse>> getCategories(int limit) async {
    try {
      // Attempt to fetch data from local data source
      final response = await _productLocalDataSource.getProduct();
      debugPrint('Banner data retrieved from local data source: $response');
      return ApiResult.success(response);
    } catch (localError) {
      // If local data retrieval fails
      debugPrint('Local data source error: $localError');

      // Check if the device is connected to the internet
      if (await _networkInfo.isConnected) {
        try {
          // Attempt to fetch data from remote data source
          final response = await _homeRemoteDataSource.getProduct(limit);
          debugPrint(
              'Banner data retrieved from remote data source: $response');

          if (response.data != null) {
            // Save response to local cache
            await _productLocalDataSource.saveProductToCache(response);
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
