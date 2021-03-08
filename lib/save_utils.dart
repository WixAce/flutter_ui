import 'package:shared_preferences/shared_preferences.dart';

class SaveUtils {
  static Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  static void clear() async {
    final SharedPreferences prefs = await _prefs;
    prefs.clear();
  }

  static Future<void> setString(String key, String value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setString(key, value);
  }

  static Future<void> setStringList(String key, List<String> values) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setStringList(key, values);
  }

  static Future<List<String>> getStringList(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getStringList(key);
  }

  static Future<String> getString(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getString(key);
  }

  static Future<int> getInt(String key) async {
    final SharedPreferences prefs = await _prefs;
    return prefs.getInt(key);
  }

  static void setInt(String key, int value) async {
    final SharedPreferences prefs = await _prefs;
    prefs.setInt(key, value);
  }
}
