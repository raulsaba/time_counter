import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:time_counter/src/core/utils/app_time_formatter.dart';

import '../../../core/errors/exceptions.dart';
import '../../../core/shared_preferences_adapter/shared_preferences_adapter.dart';

part 'working_day_state.dart';

const String workingTimePrefsKey = 'workingTime';

class WorkingDayCubit extends Cubit<WorkingDayState> {
  WorkingDayCubit(this._prefs) : super(const WorkingDayTime()) {
    load();
  }

  final SharedPreferencesAdapter _prefs;

  void setTime(TimeOfDay time) {
    emit(WorkingDayTime(time: time));

    try {
      _prefs.setString(workingTimePrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> load() async {
    final String? time = await _prefs.getString(workingTimePrefsKey);

    try {
      if (time == null) {
        setTime(const TimeOfDay(hour: 8, minute: 0));
      }
      final TimeOfDay timeOfDay = AppTimeFormater.getTime(time!);
      emit(WorkingDayTime(time: timeOfDay));
    } on TimeException catch (e) {
      debugPrint(e.message);
    }
  }

  void reset() {
    setTime(const TimeOfDay(hour: 8, minute: 0));
  }
}
