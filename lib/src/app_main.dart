import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
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
          routerConfig: goRouter,
          locale: const Locale('pt', 'BR'),
          builder: (context, child) => ResponsiveBreakpoints.builder(
            child: child!,
            breakpoints: [
              const Breakpoint(start: 0, end: 900, name: MOBILE),
              const Breakpoint(start: 901, end: double.infinity, name: DESKTOP),
            ],
          ),
        );
      },
    );
  }
}
