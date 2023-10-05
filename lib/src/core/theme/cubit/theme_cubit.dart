import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:time_counter/src/core/theme/domain/usecases/get_theme.dart';
import 'package:time_counter/src/core/theme/domain/usecases/set_theme.dart';

import '../domain/entities/theme_entity.dart';

part 'theme_state.dart';

class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit(this._getTheme, this._setTheme) : super(const ThemeInitial()) {
    _load();
  }

  final GetTheme _getTheme;
  final SetTheme _setTheme;

  setBrighrness(Brightness brightness) {
    emit(ThemeCustom(
      theme: ThemeEntity(
        brightness: brightness,
        primaryColor: state.theme.primaryColor,
      ),
    ));
    _save();
  }

  setPrimaryColor(Color color) {
    emit(ThemeCustom(
      theme: ThemeEntity(
        brightness: state.theme.brightness,
        primaryColor: color,
      ),
    ));
    _save();
  }

  _load() async {
    final result = await _getTheme();

    result.fold(
      (failure) {
        emit(ThemeError(message: failure.message));
      },
      (theme) {
        if (theme != null) {
          emit(ThemeCustom(theme: theme));
        }
      },
    );
  }

  _save() async {
    final result = await _setTheme(state.theme);

    result.fold(
      (failure) {
        emit(ThemeError(message: failure.message));
      },
      (success) {},
    );
  }
}
