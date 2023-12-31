import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/utils/app_time_formatter.dart';
import '../../core/utils/time_of_day_ext.dart';
import '../working_day/cubit/working_day_cubit.dart';
import '../working_time/cubit/working_time_cubit.dart';

class CalculatedTimeComponent extends StatelessWidget {
  const CalculatedTimeComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Text("Tempo Total Trabalhado:"),
        const WorkingTimeText(),
        const Padding(
          padding: EdgeInsets.only(top: 24.0),
          child: Text("Concluirá a jornada às:"),
        ),
        BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
          builder: (context, timeState) {
            return BlocBuilder<WorkingDayCubit, WorkingDayState>(
                builder: (context, dayState) {
              if (timeState.initialTime1 == null) {
                return Text(
                  "Trabalho não iniciado",
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
              if (timeState.initialTime2 == null &&
                  timeState.endTime1 == null) {
                return Text(
                  AppTimeFormater.getString(
                      timeState.initialTime1!.add(dayState.time)),
                  style: Theme.of(context).textTheme.displaySmall,
                );
              }
              if (timeState.initialTime2 == null) {
                return Text(
                  "Ainda no intervalo",
                  style: Theme.of(context).textTheme.titleLarge,
                );
              }
              return Text(
                AppTimeFormater.getString(timeState.initialTime2!.add(
                    dayState.time.subtract(timeState.endTime1!
                        .subtract(timeState.initialTime1!)))),
                style: Theme.of(context).textTheme.displaySmall,
              );
            });
          },
        ),
      ],
    );
  }
}

class WorkingTimeText extends StatefulWidget {
  const WorkingTimeText({
    super.key,
  });

  @override
  State<WorkingTimeText> createState() => _WorkingTimeTextState();
}

class _WorkingTimeTextState extends State<WorkingTimeText> {
  late Timer timer;
  @override
  void initState() {
    super.initState();
    final dateTime = DateTime.now();

    if (dateTime.second != 0) {
      Future.delayed(Duration(seconds: 60 - dateTime.second), () {
        setState(() {});
        timer = Timer.periodic(
            const Duration(minutes: 1), (Timer t) => setState(() {}));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WorkingTimeCubit, WorkingTimeState>(
      builder: (context, state) {
        return Text(
          AppTimeFormater.getString(state.workingTime),
          style: Theme.of(context).textTheme.displaySmall,
        );
      },
    );
  }
}
