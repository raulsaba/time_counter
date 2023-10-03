import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../common/time_component.dart';
import 'cubit/working_day_cubit.dart';

class WorkingDayComponent extends StatelessWidget {
  const WorkingDayComponent({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Selecione o tempo desejado para o contador:",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        BlocBuilder<WorkingDayCubit, WorkingDayState>(
          builder: (context, state) {
            final WorkingDayCubit cubit = context.read();
            return TimeComponent(
              time: state.getTime,
              initialTime: state.time,
              setTime: cubit.setTime,
            );
          },
        )
      ],
    );
  }
}
