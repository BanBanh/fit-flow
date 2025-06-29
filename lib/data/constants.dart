import 'package:flutter/material.dart';

const List<String> kExerciseCategories = [
  'Upper Body',
  'Lower Body',
  'Core',
  'Full Body',
  'Cardio',
];

const Map<String, Map<String, Color>> kColors = {
  'dark': {
    'bgDark': Color(0xFF1E1E1E),
    'bg': Color(0xFF3C3C3C),
    'bgLight': Color(0xFF5C5C5C),
    'text': Color(0xFFE0E0E0),
    'textMuted': Color(0xFFC2C2C2),
    'highlight': Color(0xFF7A7A7A),
    'border': Color(0xFF4D4D4D),
    'borderMuted': Color(0xFF6B6B6B),
  },

  'light': {
    'bgDark': Color(0xFFE0E0E0),
    'bg': Color(0xFFC2C2C2),
    'bgLight': Color(0xFFA3A3A3),
    'text': Color(0xFF1F1F1F),
    'textMuted': Color(0xFF3D3D3D),
    'highlight': Color(0xFF858585),
    'border': Color(0xFFB3B3B3),
    'borderMuted': Color(0xFF949494),
  },

  'other': {
    'danger': Color(0xFFE05F5F),
    'warning': Color(0xFFE0C45F),
    'success': Color(0xFF5FE08F),
    'info': Color(0xFF5F9FE0),

    'blue': Color(0xFF5A6AEA),
    'purple': Color(0xFF9D5AEA),
    'red': Color(0xFFEA5A6A),
    'orange': Color(0xFFEA9D5A),
    'yellow': Color(0xFFEAC55A),
    'green': Color(0xFF5AEA6A),
  },
};
