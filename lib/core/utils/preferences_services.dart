import 'package:shared_preferences/shared_preferences.dart';

class PreferencesService {
  static Future<void> save<T>(String key, T value) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) {
      await prefs.setString(key, value as String);
    } else if (T == int) {
      await prefs.setInt(key, value as int);
    } else if (T == double) {
      await prefs.setDouble(key, value as double);
    } else if (T == bool) {
      await prefs.setBool(key, value as bool);
    } else {
      throw Exception('Unsupported type');
    }
  }

  static Future<T?> get<T>(String key) async {
    final prefs = await SharedPreferences.getInstance();

    if (T == String) {
      return prefs.getString(key) as T?;
    } else if (T == int) {
      return prefs.getInt(key) as T?;
    } else if (T == double) {
      return prefs.getDouble(key) as T?;
    } else if (T == bool) {
      return prefs.getBool(key) as T?;
    } else {
      throw Exception('Unsupported type');
    }
  }

  static Future<void> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(key);
  }

  static Future<void> clear() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.clear();
  }
}
