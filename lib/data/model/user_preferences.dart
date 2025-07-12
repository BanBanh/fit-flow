import 'package:hive/hive.dart';

class UserPreferences {
  static const _themeModeKey = 'themeMode';
  static const _primaryColorKey = 'primaryColor';
  static const _secondaryColorKey = 'secondaryColor';
  static const _weightUnitKey = 'weightUnit';

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
    _box.put(_secondaryColorKey, color);
  }

  // Secondary Color (stored as int value)
  static String get weightUnit {
    String colorValue = _box.get(_weightUnitKey, defaultValue: 'kg');
    return colorValue;
  }

  static set weightUnit(String color) {
    _box.put(_weightUnitKey, color);
  }

  // Clear all preferences
  static void clear() {
    _box.clear();
  }
}
