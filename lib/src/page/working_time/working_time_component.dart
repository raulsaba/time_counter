import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_counter/src/page/working_time/cubit/working_time_cubit.dart';

import '../common/time_component.dart';

class WorkingTimeComponent extends StatelessWidget {
  const WorkingTimeComponent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<WorkingTimeCubit, WorkingTimeState>(
      listener: (context, state) {
        if (state.errorMessage != null && state.errorMessage != '') {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              content: Text(state.errorMessage!),
              backgroundColor: Theme.of(context).colorScheme.error,
            ),
          );
        }
      },
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Entrada 1:",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
                    builder: (context, state) {
                      final WorkingTimeCubit cubit = context.read();
                      return TimeComponent(
                        time: state.getInitialTime1,
                        initialTime: state.initialTime1 ?? TimeOfDay.now(),
                        setTime: cubit.setInitialTime1,
                      );
                    },
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Saída 1:",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
                    builder: (context, state) {
                      final WorkingTimeCubit cubit = context.read();
                      return TimeComponent(
                        time: state.getEndTime1,
                        initialTime: state.endTime1 ?? TimeOfDay.now(),
                        setTime: cubit.setEndTime1,
                        enabled: state.initialTime1 != null,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                children: [
                  Text(
                    "Entrada 2:",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
                    builder: (context, state) {
                      final WorkingTimeCubit cubit = context.read();
                      return TimeComponent(
                        time: state.getInitialTime2,
                        initialTime: state.initialTime2 ?? TimeOfDay.now(),
                        setTime: cubit.setInitialTime2,
                        enabled: state.endTime1 != null,
                      );
                    },
                  )
                ],
              ),
              Column(
                children: [
                  Text(
                    "Saída 2:",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
                    builder: (context, state) {
                      final WorkingTimeCubit cubit = context.read();
                      return TimeComponent(
                        time: state.getEndTime2,
                        initialTime: state.endTime2 ?? TimeOfDay.now(),
                        setTime: cubit.setEndTime2,
                        enabled: state.initialTime2 != null,
                      );
                    },
                  )
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
