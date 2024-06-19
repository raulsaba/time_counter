part of 'end_of_the_day_cubit.dart';

sealed class EndOfTheDayState extends Equatable {
  final TimeOfDay time;
  const EndOfTheDayState({
    this.time = const TimeOfDay(hour: 18, minute: 0),
  });

  String get getTime;
  @override
  List<Object> get props => [getTime];
}

final class EndOfTheDayTime extends EndOfTheDayState {
  const EndOfTheDayTime({super.time});
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
