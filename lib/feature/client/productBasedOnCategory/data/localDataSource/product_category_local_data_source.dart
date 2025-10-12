import 'dart:convert';

import 'package:hive/hive.dart';

class ProductCategoryCache {
  static const String _boxName = 'productsBox';

  static Future<void> saveProducts(
      String categoryId, Map<String, dynamic> data) async {
    final box = await Hive.openBox(_boxName);

    final encoded = jsonEncode({
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    await box.put(categoryId, encoded);
  }

  static Future<Map<String, dynamic>?> getCachedProducts(String categoryId,
      {int maxAgeMinutes = 10}) async {
    final box = await Hive.openBox(_boxName);
    final cachedString = box.get(categoryId);

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

  static Future<void> clearCache() async {
    final box = await Hive.openBox(_boxName);
    await box.clear();
  }
}
