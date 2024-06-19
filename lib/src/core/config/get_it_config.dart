import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:time_counter/src/core/config/get_it_config.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: 'init', // default
  preferRelativeImports: true, // default
  asExtension: true, // default
)
configureDependencies() async => await getIt.init();
