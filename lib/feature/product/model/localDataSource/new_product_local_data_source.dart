
import 'package:elminiawy/core/services/cache_local_data_source.DART';

class NewProductLocalDataSource {
  static const String _boxName = 'NewProductBox';
  static const String _key = 'NewProduct_cache';

  static Future<void> saveNewProductData(Map<String, dynamic> data) async {
    await CacheLocalDataSource.saveCache(_boxName, _key, data);
  }

  static Future<Map<String, dynamic>?> getCachedNewProductData() async {
    return await CacheLocalDataSource.readCache(_boxName, _key);
  }

  static Future<bool> refreshAndCompare(Map<String, dynamic> newData) async {
    return await CacheLocalDataSource.refreshAndCompare(
        _boxName, _key, newData);
  }
}
