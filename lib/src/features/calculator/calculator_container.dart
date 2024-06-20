import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:time_counter/src/core/config/get_it_config.dart';
import 'package:time_counter/src/features/calculator/calculator_page.dart';
import 'package:time_counter/src/features/calculator/widgets/working_time/cubit/working_time_cubit.dart';
import 'package:time_counter/src/features/config/widgets/working_day/cubit/working_day_cubit.dart';

class CalculatorContainer extends StatelessWidget {
  const CalculatorContainer({super.key});

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
      child: const CalculatorPage(),
    );
  }
}
