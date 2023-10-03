import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add(TimeOfDay time) {
    Duration duration = Duration(hours: hour, minutes: minute);
    Duration duration2 = Duration(hours: time.hour, minutes: time.minute);

    final Duration sum = duration + duration2;
    int calculatedHour = sum.inHours;
    int calculatedMinute = sum.inMinutes - (sum.inHours * 60);

    return replacing(hour: calculatedHour, minute: calculatedMinute);
  }

  TimeOfDay subtract(TimeOfDay time) {
    Duration duration = Duration(hours: hour, minutes: minute);
    Duration duration2 = Duration(hours: time.hour, minutes: time.minute);

    final Duration sub = duration - duration2;
    int calculatedHour = sub.inHours;
    int calculatedMinute = sub.inMinutes - (sub.inHours * 60);

    return replacing(hour: calculatedHour, minute: calculatedMinute);
  }
}
