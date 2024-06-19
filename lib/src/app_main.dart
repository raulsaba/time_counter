import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:time_counter/src/core/config/get_it_config.dart';
import 'package:time_counter/src/core/router/go_router.dart';

void appMain() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  return runApp(const AppWidget());
}

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: brightness,
        ),
      ),
      themedBuilder: (BuildContext context, ThemeState state) {
        return MaterialApp.router(
          title: 'Horas de Trabalho',
          theme: state.themeData,
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('pt', 'BR'),
          ],
          routeInformationParser: goRouter.routeInformationParser,
          routerDelegate: goRouter.routerDelegate,
          routeInformationProvider: goRouter.routeInformationProvider,
          locale: const Locale('pt', 'BR'),
        );
      },
    );
  }
}
