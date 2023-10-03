import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter {
  const SharedPreferencesAdapter();

  Future<SharedPreferences> getPrefs() async {
    return await SharedPreferences.getInstance();
  }

  Future<String?> getString(String key) async {
    final SharedPreferences prefs = await getPrefs();
    debugPrint("Obtendo valor para a chave $key");
    return prefs.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await getPrefs();
    debugPrint("Salvando valor $value para a chave $key");
    return await prefs.setString(key, value);
  }

  Future<bool> clear() async {
    final SharedPreferences prefs = await getPrefs();
    debugPrint("Limpando SharedPreferences");
    return await prefs.clear();
  }

  Future<bool> remove(String key) async {
    final SharedPreferences prefs = await getPrefs();
    debugPrint("Removendo valor da chave $key");
    return await prefs.remove(key);
  }
}
