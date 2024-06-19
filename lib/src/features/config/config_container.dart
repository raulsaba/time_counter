import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/config/get_it_config.dart';
import 'config_page.dart';
import 'widgets/end_of_the_day/cubit/end_of_the_day_cubit.dart';
import 'widgets/working_day/cubit/working_day_cubit.dart';

class ConfigContainer extends StatelessWidget {
  const ConfigContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => getIt.get<WorkingDayCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt.get<EndOfTheDayCubit>(),
        ),
      ],
      child: const ConfigPage(),
    );
  }
}
