

import '../../../../../core/network/error_handler/api_error_handler.dart';
import '../../response/banner_response.dart';

const cacheHomeKey = "cacheHomeKey";
const cacheHomeInterval = 60 *60* 1000; // 1 minute cache in millis

abstract class BannerLocalDataSource {
  Future<BannerResponse> getBanners();

  Future<void> saveBannesToCache(BannerResponse bannerResponse);


}

class BannerLocalDataSourceImpl implements BannerLocalDataSource {
  //run time cache
  Map<String, CachedItem> cashMap = {};

  @override
  Future<BannerResponse> getBanners() async {
    CachedItem? cachedItem = cashMap[cacheHomeKey];
    if (cachedItem != null && cachedItem.isValid(cacheHomeInterval)) {
      //return the response from cash
      return cachedItem.data;
    } else {
      // return an error that cash is not there or its not valid
      throw ErrorHandler.handle(DataSource.cacheError);
    }
  }

  @override
  Future<void> saveBannesToCache(BannerResponse bannerResponse) async {
    cashMap[cacheHomeKey] = CachedItem(bannerResponse);
  }

}

class CachedItem {
  dynamic data;
  int cacheTime = DateTime.now().millisecondsSinceEpoch;
  CachedItem(this.data);
}

extension CachedItemExtension on CachedItem {
  bool isValid(int expirationTimeInMillis) {
    int currentTimeInMillis = DateTime.now().millisecondsSinceEpoch;
    bool isValid = currentTimeInMillis - cacheTime <= expirationTimeInMillis;
    return isValid;
  }
}
