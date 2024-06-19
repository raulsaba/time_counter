part of 'working_day_cubit.dart';

@immutable
sealed class WorkingDayState extends Equatable {
  final TimeOfDay time;

  const WorkingDayState({this.time = const TimeOfDay(hour: 8, minute: 0)});

  String get getTime;

  @override
  List<Object> get props => [time];
}

final class WorkingDayTime extends WorkingDayState {
  const WorkingDayTime({super.time});

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
