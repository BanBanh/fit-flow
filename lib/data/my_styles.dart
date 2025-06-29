import 'package:fit_flow/data/constants.dart';
import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  String get themeMode {
    if (UserPreferences.themeMode == 'system') {
      final brightness = MediaQuery.of(this).platformBrightness;
      return brightness == Brightness.dark ? 'dark' : 'light';
    } else {
      return UserPreferences.themeMode;
    }
  }
}

extension TextStyleExtensions on TextStyle {
  TextStyle text(String themeMode) =>
      copyWith(color: kColors[themeMode]!['text']);
}
