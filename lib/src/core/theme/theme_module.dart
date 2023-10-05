import 'package:flutter_modular/flutter_modular.dart';
import 'package:time_counter/src/core/theme/cubit/theme_cubit.dart';
import 'package:time_counter/src/core/theme/data/datasources/theme_local_datasource.dart';
import 'package:time_counter/src/core/theme/data/repositories/theme_repository_impl.dart';
import 'package:time_counter/src/core/theme/domain/usecases/get_theme.dart';
import 'package:time_counter/src/core/theme/domain/usecases/set_theme.dart';

class ThemeModule extends Module {
  @override
  void exportedBinds(Injector i) {
    i.addLazySingleton(GetThemeImpl.new);
    i.addLazySingleton(SetThemeImpl.new);
    i.addLazySingleton(ThemeRepositoryImpl.new);
    i.addLazySingleton(ThemeLocalDataSourceImpl.new);
    i.add(ThemeCubit.new);
  }
}
