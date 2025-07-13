import 'package:flutter/material.dart';

Map<String, Map<String, dynamic>> exercises = {
  'push up': {
    'notes': '',
    'lastPerformed': '10 07 2025',
    'personalRecord': {'rep': 8, 'set': 3, 'weight': 'body weight'},
    'isFavorite': false,
    'category': 'Upper Body',
  },
  'plank': {
    'notes': '',
    'lastPerformed': '20 06 2025',
    'personalRecord': {'second': 60},
    'isFavorite': false,
    'category': '',
    'targetedMuscle': '',
  },
};

Map history = {
  '10 07 2025': {
    '0': {'name': 'push up', 'rep': 8, 'set': 3, 'weight': 'body weight'},
  },
};
