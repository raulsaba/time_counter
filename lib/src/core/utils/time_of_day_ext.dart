import 'package:flutter/material.dart';

extension TimeOfDayExtension on TimeOfDay {
  TimeOfDay add(TimeOfDay time) {
    int calculatedHour = hour;
    int calculatedMinute = minute;
    if (minute + time.minute >= 60) {
      calculatedHour++;
      calculatedMinute = (minute + time.minute) - 60;
    } else {
      calculatedMinute = minute + time.minute;
    }

    if (hour + time.hour >= 24) {
      calculatedHour = (hour + time.hour) - 24;
    } else {
      calculatedHour = hour + time.hour;
    }

    return replacing(hour: calculatedHour, minute: calculatedMinute);
  }

  TimeOfDay subtract(TimeOfDay time) {
    int calculatedHour = hour;
    int calculatedMinute = minute;

    if (minute < time.minute) {
      calculatedHour--;
      calculatedMinute = 60 - (time.minute - minute);
    } else {
      calculatedMinute = minute - time.minute;
    }

    if (hour < time.hour) {
      calculatedHour = 24 - (time.hour - hour);
    } else {
      calculatedHour = hour - time.hour;
    }

    return replacing(hour: calculatedHour, minute: calculatedMinute);
  }
}
