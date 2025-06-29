import 'package:fit_flow/data/model/history.dart';
import 'package:hive/hive.dart';

// part 'exercise.g.dart'; // For Hive code generation

@HiveType(typeId: 0)
class Exercise {
  @HiveField(0)
  final String id; // Unique
  final String name;
  final String? notes; // User-added notes
  final DateTime? lastPerformed; // Last workout date
  final History? personalRecord; // {"weight": 100, "reps": 12}
  final bool isFavorite;
  final int? restTimeSec; // Rest between sets (seconds)
  final List<String>? category;
  final List<String>? targetedMuscle;

  Exercise({
    required this.id,
    required this.name,
    this.notes,
    this.lastPerformed,
    this.personalRecord,
    this.isFavorite = false,
    this.restTimeSec,
    this.category,
    this.targetedMuscle,
  });
}
