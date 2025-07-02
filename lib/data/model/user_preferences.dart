import 'package:hive/hive.dart';

class UserPreferences {
  static const _themeModeKey = 'themeMode';
  static const _primaryColorKey = 'primaryColor';
  static const _secondaryColorKey = 'secondaryColor';
  static const _darkModeKey = 'darkMode';

  static Box get _box => Hive.box('userPrefs');

  // Theme Mode
  static String get themeMode {
    String mode = _box.get(_themeModeKey, defaultValue: 'system');
    return mode;
  }

  static set themeMode(String mode) {
    _box.put(_themeModeKey, mode);
  }

  // Primary Color (stored as int value)
  static String get primaryColor {
    String colorValue = _box.get(_primaryColorKey, defaultValue: 'blue');
    return colorValue;
  }

  static set primaryColor(String color) {
    _box.put(_primaryColorKey, color);
  }

  // Secondary Color (stored as int value)
  static String get secondaryColor {
    String colorValue = _box.get(_secondaryColorKey, defaultValue: 'orange');
    return colorValue;
  }

  static set secondaryColor(String color) {
    _box.put(_primaryColorKey, color);
  }

  // Dark Mode (simple bool)
  static bool get darkMode {
    return _box.get(_darkModeKey, defaultValue: false);
  }

  // Clear all preferences
  static void clear() {
    _box.clear();
  }
}
