import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:theme_manager/theme_manager.dart';

import 'core/theme/cubit/theme_cubit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // return BlocProvider(
    //   create: (context) => Modular.get<ThemeCubit>(),
    //   child: MaterialApp.router(
    //     builder: (context, child) {
    //       return BlocBuilder<ThemeCubit, ThemeState>(
    //         builder: (context, state) {
    //           return child!;
    //         },
    //       );
    //     },
    //     theme: ReadContext(context).read<ThemeCubit>().state.theme.themeData,
    //     title: 'Horas de Trabalho',
    //     routerConfig: Modular.routerConfig,
    //   ),
    // );
    return ThemeManager(
      defaultBrightnessPreference: BrightnessPreference.system,
      data: (Brightness brightness) => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: brightness,
        ),
        useMaterial3: true,
      ),
      loadBrightnessOnStart: true,
      themedWidgetBuilder: (BuildContext context, ThemeData theme) {
        return MaterialApp.router(
          title: 'Horas de Trabalho',
          theme: theme,
          routerConfig: Modular.routerConfig,
        );
      },
    );
  }
}
