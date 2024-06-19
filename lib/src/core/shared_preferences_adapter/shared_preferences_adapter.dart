import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_counter/src/core/logger.dart';

@lazySingleton
class SharedPreferencesAdapter {
  const SharedPreferencesAdapter(this._prefs);

  final SharedPreferences _prefs;

  Future<String?> getString(String key) async {
    Logger.cyan.log("Obtendo valor para a chave $key");
    return _prefs.getString(key) ?? '';
  }

  Future<bool> setString(String key, String value) async {
    Logger.cyan.log("Salvando valor $value para a chave $key");
    return await _prefs.setString(key, value);
  }

  Future<bool> clear() async {
    Logger.cyan.log("Limpando SharedPreferences");
    return await _prefs.clear();
  }

  Future<bool> remove(String key) async {
    Logger.cyan.log("Removendo valor da chave $key");
    return await _prefs.remove(key);
  }
}
