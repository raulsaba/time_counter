import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/cubit/theme_cubit.dart';
import 'theme/data/datasources/theme_local_datasource.dart';
import 'theme/data/repositories/theme_repository_impl.dart';
import 'theme/domain/usecases/get_theme.dart';
import 'theme/domain/usecases/set_theme.dart';

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
