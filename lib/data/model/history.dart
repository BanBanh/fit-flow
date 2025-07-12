import 'package:hive/hive.dart';

// part 'history.g.dart'; // For Hive code generation

@HiveType(typeId: 1)
class History {
  @HiveField(0)
  final String id; // Unique
  final String exerciseId;
  final int rep;
  final int set;
  final double weight;
  final String weightUnit;
  final DateTime date;

  History({
    required this.id,
    required this.exerciseId,
    required this.rep,
    required this.set,
    required this.weight,
    required this.weightUnit,
    required this.date,
  });
}
