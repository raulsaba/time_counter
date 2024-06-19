// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;
import 'package:shared_preferences/shared_preferences.dart' as _i3;

import '../../page/working_day/cubit/working_day_cubit.dart' as _i5;
import '../../page/working_time/cubit/working_time_cubit.dart' as _i6;
import '../shared_preferences_adapter/shared_preferences_adapter.dart' as _i4;
import 'register_modules.dart' as _i7;

extension GetItInjectableX on _i1.GetIt {
// initializes the registration of main-scope dependencies inside of GetIt
  Future<_i1.GetIt> init({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) async {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    final registerModules = _$RegisterModules();
    await gh.lazySingletonAsync<_i3.SharedPreferences>(
      () => registerModules.prefs,
      preResolve: true,
    );
    gh.lazySingleton<_i4.SharedPreferencesAdapter>(
        () => _i4.SharedPreferencesAdapter(gh<_i3.SharedPreferences>()));
    gh.factory<_i5.WorkingDayCubit>(
        () => _i5.WorkingDayCubit(gh<_i4.SharedPreferencesAdapter>()));
    gh.factory<_i6.WorkingTimeCubit>(
        () => _i6.WorkingTimeCubit(gh<_i4.SharedPreferencesAdapter>()));
    return this;
  }
}

class _$RegisterModules extends _i7.RegisterModules {}
