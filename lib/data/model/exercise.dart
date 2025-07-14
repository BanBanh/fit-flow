import 'package:fit_flow/data/model/date.dart';
import 'package:fit_flow/data/model/workout.dart';

enum Category { upperBody, core, lowerBody }

class Exercise {
  final String name;
  final String notes;
  final Date? lastPerformed;
  final WorkOut personalRecord;
  final bool isFavorite;
  final Category? category;

  Exercise({
    required this.name,
    this.notes = '',
    this.lastPerformed,
    required this.personalRecord,
    this.isFavorite = false,
    this.category,
  });
}
