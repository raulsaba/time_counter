import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:time_counter/src/core/utils/time_of_day_ext.dart';

import '../../../core/shared_preferences_adapter/shared_preferences_adapter.dart';
import '../../../core/utils/app_time_formatter.dart';

part 'working_time_state.dart';

const String initialTime1PrefsKey = 'initialTime1';
const String initialTime2PrefsKey = 'initialTime2';
const String endTime1PrefsKey = 'endTime1';
const String endTime2PrefsKey = 'endTime2';

class WorkingTimeCubit extends Cubit<WorkingTimeState> {
  WorkingTimeCubit() : super(const WorkingTimes()) {
    load();
  }

  final SharedPreferencesAdapter _prefs = const SharedPreferencesAdapter();

  void setInitialTime1(TimeOfDay time) {
    emit(WorkingTimes(
        initialTime1: time, initialTime2: state.initialTime2, endTime1: state.endTime1, endTime2: state.endTime2));

    try {
      _prefs.setString(initialTime1PrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.toString());
    }
  }

  void setInitialTime2(TimeOfDay time) {
    emit(WorkingTimes(
        initialTime1: state.initialTime1, initialTime2: time, endTime1: state.endTime1, endTime2: state.endTime2));

    try {
      _prefs.setString(initialTime2PrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.toString());
    }
  }

  void setEndTime1(TimeOfDay time) {
    emit(WorkingTimes(
        initialTime1: state.initialTime1, initialTime2: state.initialTime2, endTime1: time, endTime2: state.endTime2));

    try {
      _prefs.setString(endTime1PrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.toString());
    }
  }

  void setEndTime2(TimeOfDay time) {
    emit(WorkingTimes(
        initialTime1: state.initialTime1, initialTime2: state.initialTime2, endTime1: state.endTime1, endTime2: time));

    try {
      _prefs.setString(endTime2PrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> load() async {
    final String? initialTime1 = await _prefs.getString(initialTime1PrefsKey);
    final String? initialTime2 = await _prefs.getString(initialTime2PrefsKey);
    final String? endTime1 = await _prefs.getString(endTime1PrefsKey);
    final String? endTime2 = await _prefs.getString(endTime2PrefsKey);

    try {
      final TimeOfDay? initialTimeOfDay1 = initialTime1 != null ? AppTimeFormater.getTime(initialTime1) : null;
      final TimeOfDay? initialTimeOfDay2 = initialTime2 != null ? AppTimeFormater.getTime(initialTime2) : null;
      final TimeOfDay? endTimeOfDay1 = endTime1 != null ? AppTimeFormater.getTime(endTime1) : null;
      final TimeOfDay? endTimeOfDay2 = endTime2 != null ? AppTimeFormater.getTime(endTime2) : null;

      emit(WorkingTimes(
          initialTime1: initialTimeOfDay1,
          initialTime2: initialTimeOfDay2,
          endTime1: endTimeOfDay1,
          endTime2: endTimeOfDay2));
    } on TimeException catch (e) {
      debugPrint(e.toString());
      emit(const WorkingTimes());
    }
  }

  void reset() {
    _prefs.remove(initialTime1PrefsKey);
    _prefs.remove(initialTime2PrefsKey);
    _prefs.remove(endTime1PrefsKey);
    _prefs.remove(endTime2PrefsKey);
    emit(const WorkingTimes());
  }
}
