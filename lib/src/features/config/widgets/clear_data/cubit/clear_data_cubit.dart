import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../../../../core/shared_preferences_adapter/shared_preferences_adapter.dart';

@injectable
class ClearDataCubit extends Cubit<bool> {
  ClearDataCubit(this._prefs) : super(false);
  final SharedPreferencesAdapter _prefs;

  void clearData() async {
    emit(true);
    await _prefs.clear();
    emit(false);
  }
}
