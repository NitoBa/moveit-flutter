import 'package:shared_preferences/shared_preferences.dart';

import 'i_local_storage.dart';

class SharedPrefs implements ILocalStorage {
  @override
  Future<dynamic> getByKey(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.get(key);
  }

  @override
  Future<bool> remove(String key) async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.remove(key);
  }

  @override
  Future<bool> clearAll() async {
    final prefs = await SharedPreferences.getInstance();
    return await prefs.clear();
  }

  @override
  Future<bool> save(String key, value) async {
    bool isSaved;
    final prefs = await SharedPreferences.getInstance();

    if (value is String) {
      isSaved = await prefs.setString(key, value);
      return isSaved;
    } else if (value is List<String>) {
      isSaved = await prefs.setStringList(key, value);
      return isSaved;
    } else if (value is int) {
      isSaved = await prefs.setInt(key, value);
      return isSaved;
    } else if (value is double) {
      isSaved = await prefs.setDouble(key, value);
      return isSaved;
    } else {
      isSaved = await prefs.setBool(key, value);
      return isSaved;
    }
  }
}
