import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../shared/widgets/time_component.dart';
import 'cubit/end_of_the_day_cubit.dart';

class EndOfTheDayComponent extends StatelessWidget {
  const EndOfTheDayComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Text(
          "Horário do fim do expediente:",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        BlocBuilder<EndOfTheDayCubit, EndOfTheDayState>(
          builder: (context, state) {
            final EndOfTheDayCubit cubit = context.read();
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
