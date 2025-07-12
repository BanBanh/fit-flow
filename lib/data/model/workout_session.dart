import 'package:fit_flow/data/model/history.dart';

class WorkoutSession {
  final String id;
  final DateTime date;
  final String? notes;
  final List<History> exercises;
  final Duration? duration;

  WorkoutSession({
    required this.id,
    required this.date,
    required this.notes,
    required this.exercises,
    required this.duration,
  });
}
