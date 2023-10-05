import 'package:flutter/material.dart';

import '../errors/exceptions.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add(TimeOfDay time) {
    try {
      Duration duration = Duration(hours: hour, minutes: minute);
      Duration duration2 = Duration(hours: time.hour, minutes: time.minute);

      final Duration sum = duration + duration2;
      int calculatedHour = sum.inHours;
      int calculatedMinute = sum.inMinutes - (sum.inHours * 60);

      return replacing(hour: calculatedHour, minute: calculatedMinute);
    } catch (e) {
      throw TimeException(message: "Erro ao somar o tempo");
    }
  }

  TimeOfDay subtract(TimeOfDay time) {
    try {
      Duration duration = Duration(hours: hour, minutes: minute);
      Duration duration2 = Duration(hours: time.hour, minutes: time.minute);

      final Duration sub = duration - duration2;
      int calculatedHour = sub.inHours;
      int calculatedMinute = sub.inMinutes - (sub.inHours * 60);

      return replacing(hour: calculatedHour, minute: calculatedMinute);
    } catch (e) {
      throw TimeException(message: "Erro ao subtrair o tempo");
    }
  }
}
