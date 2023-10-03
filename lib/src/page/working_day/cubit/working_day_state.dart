part of 'working_day_cubit.dart';

@immutable
sealed class WorkingDayState {
  final TimeOfDay time;

  const WorkingDayState({this.time = const TimeOfDay(hour: 8, minute: 0)});

  String get getTime;
}

final class WorkingDayTime extends WorkingDayState {
  const WorkingDayTime({TimeOfDay time = const TimeOfDay(hour: 8, minute: 0)}) : super(time: time);

  @override
  String get getTime {
    try {
      return AppTimeFormater.getString(time);
    } on TimeException catch (e) {
      debugPrint(e.toString());
      return '';
    }
  }
}
