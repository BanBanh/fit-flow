import 'package:fit_flow/data/model/exercise.dart';
import 'package:flutter/material.dart';

List<Exercise> exercisesTest = [
  Exercise(name: 'Plank', notes: '', category: Category.core),
  Exercise(name: 'Plank1', notes: '', category: Category.upperBody),
  Exercise(name: 'Push Up', notes: '', category: Category.upperBody),
]..sort((a, b) => a.name.toUpperCase().compareTo(b.name.toUpperCase()));

Map history = {
  '10 07 2025': {
    '0': {'name': 'push up', 'rep': 8, 'set': 3, 'weight': 'body weight'},
  },
};
