import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/errors/exceptions.dart';
import '../../../../../core/shared_preferences_adapter/shared_preferences_adapter.dart';
import '../../../../../shared/resources/cache_key_strings.dart';
import '../../../../../shared/utils/app_time_formatter.dart';

part 'working_day_state.dart';

@injectable
class WorkingDayCubit extends Cubit<WorkingDayState> {
  WorkingDayCubit(this._prefs) : super(const WorkingDayTime()) {
    load();
  }

  final SharedPreferencesAdapter _prefs;

  void setTime(TimeOfDay time) {
    emit(WorkingDayTime(time: time));

    try {
      _prefs.setString(ChaceKeyStrings.workingDayPrefsKey, AppTimeFormater.getString(time));
    } on TimeException catch (e) {
      debugPrint(e.message);
    }
  }

  Future<void> load() async {
    final String? time = await _prefs.getString(ChaceKeyStrings.workingDayPrefsKey);

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
