import 'package:elminiawy/feature/home/data/response/category_response.dart';

import '../../../../../core/network/error_handler/api_error_handler.dart';

const cacheHomeKey = "cacheHomeKey";
const cacheHomeInterval = 60 * 60 * 1000; // 1 minute cache in millis

abstract class CategoryLocalDataSource {
  Future<CategoryResponse> getCategories();

  Future<void> saveCategoryToCache(CategoryResponse categoryResponse);
}

class CategoryLocalDataSourceImpl implements CategoryLocalDataSource {
  //run time cache
  Map<String, CachedItem> cashMap = {};

  @override
  Future<CategoryResponse> getCategories() async {
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
  Future<void> saveCategoryToCache(CategoryResponse categoryResponse) async {
    cashMap[cacheHomeKey] = CachedItem(categoryResponse);
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
