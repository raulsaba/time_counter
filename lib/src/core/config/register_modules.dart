// ignore_for_file: invalid_annotation_target

import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@module
abstract class RegisterModules {
  @preResolve
  @LazySingleton()
  Future<SharedPreferences> get prefs => SharedPreferences.getInstance();
}
