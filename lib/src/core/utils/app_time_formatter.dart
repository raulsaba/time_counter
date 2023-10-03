import 'package:flutter/material.dart';

class AppTimeFormater {
  static String getString(TimeOfDay time) {
    try {
      return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      throw const TimeException("Erro ao formatar o tempo");
    }
  }

  static TimeOfDay getTime(String time) {
    try {
      final List<String> timeSplited = time.split(":");
      if (timeSplited.length != 2) {
        throw const TimeException("Formato de tempo incorreto");
      }
      if (int.parse(timeSplited[0]) > 23) {
        throw const TimeException("Hora inválida");
      }
      if (int.parse(timeSplited[1]) > 59) {
        throw const TimeException("Minuto inválido");
      }
      return TimeOfDay(
          hour: int.parse(timeSplited[0]), minute: int.parse(timeSplited[1]));
    } catch (e) {
      throw const TimeException("Erro ao formatar o tempo");
    }
  }
}

class TimeException implements Exception {
  final String message;

  const TimeException(this.message);
}
