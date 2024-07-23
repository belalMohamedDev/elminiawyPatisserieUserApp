import 'package:elminiawy/feature/home/data/response/category_response.dart';
import 'package:elminiawy/feature/home/data/response/product_response.dart';

import '../../../../../core/network/api/app_api.dart';
import '../../response/banner_response.dart';

abstract class HomeRemoteDataSource {
  Future<BannerResponse> banner();
  Future<CategoryResponse> categories();
  Future<ProductResponse> getProduct(int limit);
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
  
  @override
  Future<ProductResponse> getProduct(int limit) async{
     return await _appServiceClient.getProduct(limit);
  }
  
 
}
