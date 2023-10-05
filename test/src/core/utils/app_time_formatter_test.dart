import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_counter/src/core/errors/exceptions.dart';
import 'package:time_counter/src/core/utils/app_time_formatter.dart';

void main() {
  group('AppTimeFormater -', () {
    group('getString() -', () {
      test(
        "should return a string with the time formatted",
        () async {
          const TimeOfDay time = TimeOfDay(hour: 10, minute: 30);
          final String result = AppTimeFormater.getString(time);
          const String expected = "10:30";

          expect(result, expected);
        },
      );
    });

    group('getTime() -', () {
      test(
        "getTime() should return a TimeOfDay with the time formatted",
        () async {
          const String time = "10:30";
          final TimeOfDay result = AppTimeFormater.getTime(time);
          const TimeOfDay expected = TimeOfDay(hour: 10, minute: 30);

          expect(result, expected);
        },
      );

      test(
        "should throw a TimeException when the time minute is invalid",
        () async {
          const String time = "10:60";

          expect(() => AppTimeFormater.getTime(time), throwsA(isA<TimeException>()));
        },
      );

      test(
        "should throw a TimeException when the time hour is invalid",
        () async {
          const String time = "25:30";

          expect(() => AppTimeFormater.getTime(time), throwsA(isA<TimeException>()));
        },
      );

      test(
        "should throw a TimeException when the time minute and hour are invalid",
        () async {
          const String time = "25:60";

          expect(() => AppTimeFormater.getTime(time), throwsA(isA<TimeException>()));
        },
      );

      test(
        "should throw a TimeException when the input isn't a time",
        () async {
          const String time = "abc";

          expect(() => AppTimeFormater.getTime(time), throwsA(isA<TimeException>()));
        },
      );
    });
  });
}
