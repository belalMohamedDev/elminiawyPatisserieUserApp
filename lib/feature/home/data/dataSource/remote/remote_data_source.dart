import 'package:elminiawy/feature/home/data/response/category_response.dart';

import '../../../../../core/network/api/app_api.dart';
import '../../response/banner_response.dart';

abstract class HomeRemoteDataSource {
  Future<BannerResponse> banner();
  Future<CategoryResponse> categories();
}

class HomeRemoteDataSourceImpl implements HomeRemoteDataSource {
  final AppServiceClient _appServiceClient;
  HomeRemoteDataSourceImpl(this._appServiceClient);
  @override
  Future<BannerResponse> banner() async {
    return await _appServiceClient.getBanners();
  }

  @override
  Future<CategoryResponse> categories() async {
    return await _appServiceClient.getCategories();
  }
}
