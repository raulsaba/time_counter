import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_manager/theme_manager.dart';
import 'package:time_counter/src/core/config/get_it_config.dart';
import 'package:time_counter/src/page/working_day/cubit/working_day_cubit.dart';
import 'working_time/cubit/working_time_cubit.dart';

import 'calculated_time/calculated_time_component.dart';
import 'working_day/working_day_component.dart';
import 'working_time/working_time_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt.get<WorkingTimeCubit>(),
        ),
        BlocProvider(
          create: (context) => getIt.get<WorkingDayCubit>(),
        ),
      ],
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Horas de Trabalho"),
          actions: [
            IconButton(
              onPressed: () {
                if (ThemeManager.of(context).state.brightnessPreference == BrightnessPreference.dark) {
                  ThemeManager.of(context).setBrightness(BrightnessPreference.light);
                } else {
                  ThemeManager.of(context).setBrightness(BrightnessPreference.dark);
                }
              },
              icon: Icon(ThemeManager.of(context).state.brightnessPreference == BrightnessPreference.dark
                  ? Icons.light_mode
                  : Icons.dark_mode),
            ),
          ],
        ),
        body: const Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              WorkingDayComponent(),
              WorkingTimeComponent(),
              CalculatedTimeComponent(),
            ],
          ),
        ),
        floatingActionButton: BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
          builder: (context, state) {
            return FloatingActionButton(
              onPressed: () {
                context.read<WorkingTimeCubit>().reset();
              },
              child: const Icon(Icons.refresh),
            );
          },
        ),
      ),
    );
  }
}
