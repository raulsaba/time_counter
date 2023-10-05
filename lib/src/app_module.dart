import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:time_counter/src/core/theme/theme_module.dart';

import 'core/shared_preferences_adapter/shared_preferences_adapter.dart';
import 'page/home_page.dart';
import 'page/working_day/cubit/working_day_cubit.dart';
import 'page/working_time/cubit/working_time_cubit.dart';

class AppModule extends Module {
  final SharedPreferences prefs;

  AppModule(this.prefs);

  @override
  void binds(i) {
    i.addInstance(SharedPreferencesAdapter(prefs));
    i.add(WorkingDayCubit.new);
    i.add(WorkingTimeCubit.new);
  }

  @override
  void routes(r) {
    r.child(
      '/',
      child: (context) => MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => Modular.get<WorkingDayCubit>(),
          ),
          BlocProvider(
            create: (context) => Modular.get<WorkingTimeCubit>(),
          )
        ],
        child: const HomePage(),
      ),
    );
  }

  @override
  List<Module> get imports => [
        ThemeModule(),
      ];
}
