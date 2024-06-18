import 'package:flutter_modular/flutter_modular.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'shared_preferences_adapter/shared_preferences_adapter.dart';

class CoreModule extends Module {
  final SharedPreferences prefs;

  CoreModule(this.prefs);
  @override
  void exportedBinds(Injector i) {
    i.addInstance(SharedPreferencesAdapter(prefs));
  }
}
