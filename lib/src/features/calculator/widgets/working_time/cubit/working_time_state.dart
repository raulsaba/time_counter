part of 'working_time_cubit.dart';

@immutable
sealed class WorkingTimeState {
  final TimeOfDay? initialTime1;
  final TimeOfDay? initialTime2;
  final TimeOfDay? endTime1;
  final TimeOfDay? endTime2;
  final String? errorMessage;

  const WorkingTimeState({
    this.initialTime1,
    this.initialTime2,
    this.endTime1,
    this.endTime2,
    this.errorMessage,
  });

  String get getInitialTime1;
  String get getInitialTime2;
  String get getEndTime1;
  String get getEndTime2;

  TimeOfDay get workingTime;
}

final class WorkingTimes extends WorkingTimeState {
  const WorkingTimes({
    super.initialTime1,
    super.initialTime2,
    super.endTime1,
    super.endTime2,
    super.errorMessage,
  });

  @override
  TimeOfDay get workingTime {
    TimeOfDay workingTime = const TimeOfDay(hour: 0, minute: 0);
    if (initialTime1 == null) {
      return workingTime;
    }

    if (endTime1 == null) {
      workingTime = TimeOfDay.now().subtract(initialTime1!);
    } else {
      workingTime = endTime1!.subtract(initialTime1!);
    }

    if (initialTime2 != null) {
      TimeOfDay workingTime2 = const TimeOfDay(hour: 0, minute: 0);
      if (endTime2 == null) {
        workingTime2 = TimeOfDay.now().subtract(initialTime2!);
      } else {
        workingTime2 = endTime2!.subtract(initialTime2!);
      }
      workingTime = workingTime.add(workingTime2);
    }

    return workingTime;
  }

  @override
  String get getEndTime1 {
    if (endTime1 == null) {
      return '';
    }
    try {
      return AppTimeFormater.getString(endTime1!);
    } on TimeException catch (e) {
      Logger.red.log(e.toString());
      return '';
    }
  }

  @override
  String get getEndTime2 {
    if (endTime2 == null) {
      return '';
    }
    try {
      return AppTimeFormater.getString(endTime2!);
    } on TimeException catch (e) {
      Logger.red.log(e.toString());
      return '';
    }
  }

  @override
  String get getInitialTime1 {
    if (initialTime1 == null) {
      return '';
    }
    try {
      return AppTimeFormater.getString(initialTime1!);
    } on TimeException catch (e) {
      Logger.red.log(e.toString());
      return '';
    }
  }

  @override
  String get getInitialTime2 {
    if (initialTime2 == null) {
      return '';
    }
    try {
      return AppTimeFormater.getString(initialTime2!);
    } on TimeException catch (e) {
      Logger.red.log(e.toString());
      return '';
    }
  }
}
