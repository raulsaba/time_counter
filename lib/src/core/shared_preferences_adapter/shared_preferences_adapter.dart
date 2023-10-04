import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesAdapter {
  const SharedPreferencesAdapter(this._prefs);

  final SharedPreferences _prefs;

  Future<String?> getString(String key) async {
    debugPrint("Obtendo valor para a chave $key");
    return _prefs.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    debugPrint("Salvando valor $value para a chave $key");
    return await _prefs.setString(key, value);
  }

  Future<bool> clear() async {
    debugPrint("Limpando SharedPreferences");
    return await _prefs.clear();
  }

  Future<bool> remove(String key) async {
    debugPrint("Removendo valor da chave $key");
    return await _prefs.remove(key);
  }
}
