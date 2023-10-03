import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_counter/src/page/working_time/cubit/working_time_cubit.dart';

import 'calculated_time/calculated_time_component.dart';
import 'working_day/working_day_component.dart';
import 'working_time/working_time_component.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).colorScheme.inversePrimary,
          title: const Text("Horas de Trabalho"),
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
        ));
  }
}
