import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static late SharedPreferences sharedPreferences;

  static Future<void> init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future<bool> saveData({
    required String key,
    required dynamic value,
  }) async {
    if (value is String) return await sharedPreferences.setString(key, value);
    if (value is int) return await sharedPreferences.setInt(key, value);
    if (value is bool) return await sharedPreferences.setBool(key, value);
    if (value is double) return await sharedPreferences.setDouble(key, value);
    if (value is List<String>) {
      return await sharedPreferences.setStringList(key, value);
    }
    return false;
  }

  static dynamic getData({required String key}) {
    return sharedPreferences.get(key);
  }

  static String? getString({required String key}) {
    return sharedPreferences.getString(key);
  }

  static bool? getBool({required String key}) {
    return sharedPreferences.getBool(key);
  }

  static int? getInt({required String key}) {
    return sharedPreferences.getInt(key);
  }

  static double? getDouble({required String key}) {
    return sharedPreferences.getDouble(key);
  }

  static List<String>? getStringList({required String key}) {
    return sharedPreferences.getStringList(key);
  }

  static Future<bool> removeData({required String key}) async {
    return await sharedPreferences.remove(key);
  }

  static Future<bool> clearData() async {
    return await sharedPreferences.clear();
  }

  static bool contains({required String key}) {
    return sharedPreferences.containsKey(key);
  }
}
