import 'dart:convert';
import 'package:hive/hive.dart';

class CacheLocalDataSource {
  // Save (with timestamp)
  static Future<void> saveCache(
      String boxName, String key, Map<String, dynamic> data) async {
    final box = await Hive.openBox(boxName);

    final encoded = jsonEncode({
      'data': data,
      'timestamp': DateTime.now().millisecondsSinceEpoch,
    });

    await box.put(key, encoded);
  }

  // Read
  static Future<Map<String, dynamic>?> readCache(
      String boxName, String key) async {
    final box = await Hive.openBox(boxName);
    final cachedString = box.get(key);

    if (cachedString == null) return null;

    final cached = jsonDecode(cachedString);
    return Map<String, dynamic>.from(cached['data']);
  }

  // Compare & Refresh
  static Future<bool> refreshAndCompare(
      String boxName, String key, Map<String, dynamic> newData) async {
    final box = await Hive.openBox(boxName);
    final cachedString = box.get(key);

    // No cache → save new
    if (cachedString == null) {
      await saveCache(boxName, key, newData);
      return true;
    }

    final cached = jsonDecode(cachedString);
    final oldData = Map<String, dynamic>.from(cached['data']);

    // Compare
    if (jsonEncode(oldData) != jsonEncode(newData)) {
      await saveCache(boxName, key, newData);
      return true;
    }

    return false; // No changes
  }
}
