import 'package:flutter/material.dart';

import 'widgets/end_of_the_day/end_of_the_day_component.dart';
import 'widgets/working_day/working_day_component.dart';

class ConfigPage extends StatelessWidget {
  const ConfigPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        WorkingDayComponent(),
        EndOfTheDayComponent(),
      ],
    );
  }
}
