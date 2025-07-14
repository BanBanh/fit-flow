import 'package:fit_flow/data/model/date.dart';
import 'package:fit_flow/data/model/exercise.dart';
import 'package:fit_flow/data/model/history.dart';
import 'package:fit_flow/data/model/workout.dart';
import 'package:flutter/material.dart';

List<Exercise> exercisesTest = [
  Exercise(
    name: 'Plank',
    notes: '',
    category: Category.core,
    personalRecord: WorkOut(),
  ),
  Exercise(
    name: 'Plank1',
    notes: '',
    category: Category.upperBody,
    personalRecord: WorkOut(),
  ),
  Exercise(
    name: 'Push Up',
    notes: '',
    category: Category.upperBody,
    personalRecord: WorkOut(rep: 8, set: 3),
  ),
]..sort((a, b) => a.name.toUpperCase().compareTo(b.name.toUpperCase()));

List<History> histories = [
  History(date: Date.now(), workOutList: {'Push up': WorkOut(rep: 8, set: 3)}),
];
