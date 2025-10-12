import 'dart:convert';

import 'package:hive/hive.dart';

class CategoryLocalDataSource {
  static const String _boxName = 'categoryBox';

  static Future<void> saveCategoryData(
     Map<String, dynamic> data) async {
    final box = await Hive.openBox(_boxName);

    final encoded = jsonEncode({
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    await box.put( 'category_cache',encoded);
  }

  static Future<Map<String, dynamic>?> getCachedCategoryData(
      {int maxAgeMinutes = 10}) async {
    final box = await Hive.openBox(_boxName);
    final cachedString = box.get('category_cache');

    if (cachedString == null) return null;

    final cached = jsonDecode(cachedString);

    final timestamp = cached['timestamp'] as int;
    final ageMinutes =
        (DateTime.now().millisecondsSinceEpoch - timestamp) ~/ 60000;

    if (ageMinutes > maxAgeMinutes) {
      return null;
    }

    return Map<String, dynamic>.from(cached['data']);
  }

  static Future<void> clearCategoryDataCache() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
