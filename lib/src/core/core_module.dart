import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_counter/src/core/theme/cubit/theme_cubit.dart';
import 'package:time_counter/src/core/theme/data/datasources/theme_local_datasource.dart';
import 'package:time_counter/src/core/theme/data/repositories/theme_repository_impl.dart';
import 'package:time_counter/src/core/theme/domain/usecases/get_theme.dart';
import 'package:time_counter/src/core/theme/domain/usecases/set_theme.dart';

import 'shared_preferences_adapter/shared_preferences_adapter.dart';

class CoreModule extends Module {
  final SharedPreferences prefs;

  CoreModule(this.prefs);
  @override
  void exportedBinds(Injector i) {
    i.addInstance(SharedPreferencesAdapter(prefs));
    // i.addSingleton(ThemeLocalDataSourceImpl.new);
    // i.addSingleton(ThemeRepositoryImpl.new);
    // i.addSingleton(GetThemeImpl.new);
    // i.addSingleton(SetThemeImpl.new);
    // i.add(ThemeCubit.new);
  }
}
