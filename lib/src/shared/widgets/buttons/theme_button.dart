import 'package:flutter/material.dart';
import 'package:theme_manager/enums.dart';
import 'package:theme_manager/theme_manager_widget.dart';

class ThemeButton extends StatelessWidget {
  const ThemeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        if (ThemeManager.of(context).state.brightnessPreference == BrightnessPreference.dark) {
          ThemeManager.of(context).setBrightness(BrightnessPreference.light);
        } else {
          ThemeManager.of(context).setBrightness(BrightnessPreference.dark);
        }
      },
      icon: Icon(ThemeManager.of(context).state.brightnessPreference == BrightnessPreference.dark
          ? Icons.light_mode
          : Icons.dark_mode),
    );
  }
}
