import 'package:fit_flow/data/model/user_preferences.dart';
import 'package:flutter/material.dart';

extension DarkMode on BuildContext {
  /// is dark mode currently enabled?
  bool get themeMode {
    if (UserPreferences.themeMode == 'system') {
      final brightness = MediaQuery.of(this).platformBrightness;
      return brightness == Brightness.dark;
    } else {
      return UserPreferences.themeMode == 'dark';
    }
  }
}

class MyDecor {
  final bool isDarkMode;

  MyDecor(this.isDarkMode);

  Color get text => isDarkMode ? Color(0xFFE0E0E0) : Color(0xFF1F1F1F);
  Color get textMuted => isDarkMode ? Color(0xFFC2C2C2) : Color(0xFF3D3D3D);

  Color get bgDark => isDarkMode ? Color(0xFF1E1E1E) : Color(0xFFB3B3B3);
  Color get bg => isDarkMode ? Color(0xFF3C3C3C) : Color(0xFFD1D1D1);
  Color get bgLight => isDarkMode ? Color(0xFF5C5C5C) : Color(0xFFF0F0F0);
  Color get border => isDarkMode ? Color(0xFF7A7A7A) : Color(0xFF858585);
  Color get borderMuted => isDarkMode ? Color(0xFF999999) : Color(0xFF666666);

  Color get danger => Color(0xFFE05F5F);
  Color get warning => Color(0xFFE0C45F);
  Color get success => Color(0xFF5FE08F);
  Color get info => Color(0xFF5F9FE0);

  Color get blue => Color(0xFF5A6AEA);
  Color get purple => Color(0xFF9D5AEA);
  Color get red => Color(0xFFEA5A6A);
  Color get orange => Color(0xFFEA9D5A);
  Color get yellow => Color(0xFFEAC55A);
  Color get green => Color(0xFF5AEA6A);
}
