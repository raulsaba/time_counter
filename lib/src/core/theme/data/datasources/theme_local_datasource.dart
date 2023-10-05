import 'dart:convert';

import 'package:time_counter/src/core/shared_preferences_adapter/shared_preferences_adapter.dart';

import '../model/theme_model.dart';

abstract class ThemeLocalDataSource {
  Future<ThemeModel?> getTheme();
  Future<bool> setTheme(ThemeModel theme);
}

class ThemeLocalDataSourceImpl implements ThemeLocalDataSource {
  final SharedPreferencesAdapter _prefs;

  ThemeLocalDataSourceImpl(this._prefs);

  final String themeKey = 'THEME_KEY';

  @override
  Future<ThemeModel?> getTheme() async {
    final themeString = await _prefs.getString(themeKey);
    if (themeString != null) {
      return ThemeModel.fromMap(jsonDecode(themeString));
    }
    return null;
  }

  @override
  Future<bool> setTheme(ThemeModel theme) async {
    return await _prefs.setString(themeKey, jsonEncode(theme.toMap()));
  }
}
