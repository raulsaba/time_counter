import 'package:flutter/material.dart';
import '../../domain/entities/theme_entity.dart';

class ThemeModel extends ThemeEntity {
  ThemeModel({required super.primaryColor, required super.brightness});

  factory ThemeModel.fromEntity(ThemeEntity entity) {
    return ThemeModel(
      primaryColor: entity.primaryColor,
      brightness: entity.brightness,
    );
  }

  factory ThemeModel.fromMap(Map<String, dynamic> map) {
    return ThemeModel(
      primaryColor: Color(map['primaryColor']),
      brightness:
          map['brightness'] == 'light' ? Brightness.light : Brightness.dark,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'primaryColor': primaryColor.value,
      'brightness': brightness == Brightness.light ? 'light' : 'dark',
    };
  }
}
