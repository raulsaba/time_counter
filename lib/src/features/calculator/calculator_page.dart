import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'widgets/calculated_time/calculated_time_component.dart';
import 'widgets/working_time/cubit/working_time_cubit.dart';
import 'widgets/working_time/working_time_component.dart';

class CalculatorPage extends StatelessWidget {
  const CalculatorPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
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
    );
  }
}
