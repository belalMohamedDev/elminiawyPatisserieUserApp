import 'dart:convert';

import 'package:hive/hive.dart';

class BannerLocalDataSource {
  static const String _boxName = 'bannerBox';

  static Future<void> saveBannerData(Map<String, dynamic> data) async {
    final box = await Hive.openBox(_boxName);

    final encoded = jsonEncode({
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    await box.put('banner_cache', encoded);
  }

  static Future<Map<String, dynamic>?> getCachedBannerData() async {
    final box = await Hive.openBox(_boxName);
    final cachedString = box.get('banner_cache');

    if (cachedString == null) return null;

    final cached = jsonDecode(cachedString);

    return Map<String, dynamic>.from(cached['data']);
  }



  static Future<bool> refreshAndCompare(Map<String, dynamic> newData) async {
    final box = await Hive.openBox(_boxName);
    final cachedString = box.get('banner_cache');

    if (cachedString == null) {
      await box.put(
        'banner_cache',
        jsonEncode({
          'data': newData,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        }),
      );
      return true;
    }

    final cached = jsonDecode(cachedString);
    final oldData = Map<String, dynamic>.from(cached['data']);

    if (jsonEncode(oldData) != jsonEncode(newData)) {
      await box.put(
        'category_cache',
        jsonEncode({
          'data': newData,
          'timestamp': DateTime.now().millisecondsSinceEpoch,
        }),
      );
      return true;
    }

    return false;
  }
}
