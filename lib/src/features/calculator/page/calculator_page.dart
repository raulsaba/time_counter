import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_counter/src/core/config/get_it_config.dart';
import 'package:time_counter/src/features/calculator/page/working_day/cubit/working_day_cubit.dart';
import 'working_time/cubit/working_time_cubit.dart';

import 'calculated_time/calculated_time_component.dart';
import 'working_day/working_day_component.dart';
import 'working_time/working_time_component.dart';

class WorkingTimePage extends StatelessWidget {
  const WorkingTimePage({super.key});

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
