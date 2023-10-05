import 'package:flutter/material.dart';

import '../errors/exceptions.dart';

class AppTimeFormater {
  static String getString(TimeOfDay time) {
    try {
      return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
    } catch (e) {
      throw TimeException(message: "Erro ao formatar o tempo");
    }
  }

  static TimeOfDay getTime(String time) {
    try {
      final List<String> timeSplited = time.split(":");
      if (timeSplited.length != 2) {
        throw TimeException(message: "Formato de tempo incorreto");
      }
      if (int.parse(timeSplited[0]) > 23) {
        throw TimeException(message: "Hora inválida");
      }
      if (int.parse(timeSplited[1]) > 59) {
        throw TimeException(message: "Minuto inválido");
      }
      return TimeOfDay(hour: int.parse(timeSplited[0]), minute: int.parse(timeSplited[1]));
    } catch (e) {
      throw TimeException(message: "Erro ao formatar o tempo");
    }
  }
}
