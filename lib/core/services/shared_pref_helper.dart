import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefHelper {
  // Private constructor to prevent instantiation.
  SharedPrefHelper._();

  /// Removes a value from SharedPreferences with the given [key].
  static Future<void> removeData(String key) async {
    debugPrint('SharedPrefHelper: Removing data with key: $key');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.remove(key);
  }

  /// Removes all keys and values from SharedPreferences.
  static Future<void> clearAllData() async {
    debugPrint('SharedPrefHelper: Clearing all data');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    await sharedPreferences.clear();
  }

  /// Saves a [value] with a [key] in SharedPreferences.
  static Future<void> setData(String key, dynamic value) async {
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    debugPrint(
        "SharedPrefHelper: Setting data with key: $key and value: $value");
    if (value is String) {
      await sharedPreferences.setString(key, value);
    } else if (value is int) {
      await sharedPreferences.setInt(key, value);
    } else if (value is bool) {
      await sharedPreferences.setBool(key, value);
    } else if (value is double) {
      await sharedPreferences.setDouble(key, value);
    } else {
      throw ArgumentError('Unsupported value type');
    }
  }

  /// Gets a bool value from SharedPreferences with the given [key].
  static Future<bool> getBool(String key) async {
    debugPrint('SharedPrefHelper: Getting bool with key: $key');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return  sharedPreferences.getBool(key) ?? false;
  }

  /// Gets a double value from SharedPreferences with the given [key].
  static Future<double> getDouble(String key) async {
    debugPrint('SharedPrefHelper: Getting double with key: $key');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getDouble(key) ?? 0.0;
  }

  /// Gets an int value from SharedPreferences with the given [key].
  static Future<int> getInt(String key) async {
    debugPrint('SharedPrefHelper: Getting int with key: $key');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getInt(key) ?? 0;
  }

  /// Gets a String value from SharedPreferences with the given [key].
  static Future<String> getString(String key) async {
    debugPrint('SharedPrefHelper: Getting string with key: $key');
    final SharedPreferences sharedPreferences =
        await SharedPreferences.getInstance();
    return sharedPreferences.getString(key) ?? '';
  }

  /// Saves a [value] with a [key] in FlutterSecureStorage.
  static Future<void> setSecuredString(String key, String value) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint(
        'FlutterSecureStorage: Setting secured string with key: $key and value: $value');
    await flutterSecureStorage.write(key: key, value: value);
  }

  /// Gets a String value from FlutterSecureStorage with the given [key].
  static Future<String> getSecuredString(String key) async {
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    debugPrint('FlutterSecureStorage: Getting secured string with key: $key');
    return await flutterSecureStorage.read(key: key) ?? '';
  }

  /// Removes all keys and values from FlutterSecureStorage.
  static Future<void> clearAllSecuredData() async {
    debugPrint('FlutterSecureStorage: Clearing all secured data');
    const FlutterSecureStorage flutterSecureStorage = FlutterSecureStorage();
    await flutterSecureStorage.deleteAll();
  }
}



