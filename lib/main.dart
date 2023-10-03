import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_counter/src/page/working_day/cubit/working_day_cubit.dart';
import 'package:time_counter/src/page/working_time/cubit/working_time_cubit.dart';

import 'src/page/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Horas de Trabalho',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: MultiBlocProvider(
        providers: [
          BlocProvider(
            create: (context) => WorkingDayCubit(),
          ),
          BlocProvider(
            create: (context) => WorkingTimeCubit(),
          )
        ],
        child: const HomePage(),
      ),
    );
  }
}
