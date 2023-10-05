import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class ThemeEntity extends Equatable {
  final Color primaryColor;
  final Brightness brightness;

  const ThemeEntity({required this.primaryColor, required this.brightness});

  ThemeData get themeData => ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: primaryColor,
          brightness: brightness,
        ),
        useMaterial3: true,
      );

  @override
  List<Object?> get props => [primaryColor, brightness];
}
