import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:time_counter/src/core/utils/time_of_day_ext.dart';

void main() {
  group('TimeOfDayExtension', () {
    test(
      "add() should return a TimeOfDay with the sum of the two times",
      () async {
        const TimeOfDay time1 = TimeOfDay(hour: 10, minute: 30);
        const TimeOfDay time2 = TimeOfDay(hour: 5, minute: 45);
        final TimeOfDay result = time1.add(time2);
        const TimeOfDay expected = TimeOfDay(hour: 16, minute: 15);

        expect(result, expected);
      },
    );

    test(
      "subtract() should return a TimeOfDay with the subtraction of the two times",
      () async {
        const TimeOfDay time1 = TimeOfDay(hour: 10, minute: 30);
        const TimeOfDay time2 = TimeOfDay(hour: 5, minute: 45);
        final TimeOfDay result = time1.subtract(time2);
        const TimeOfDay expected = TimeOfDay(hour: 4, minute: 45);

        expect(result, expected);
      },
    );
  });
}
