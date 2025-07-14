import 'package:fit_flow/data/model/date.dart';
import 'package:fit_flow/data/model/workout.dart';

class History {
  final Date date;
  final List<WorkOut> workOutList;

  History({required this.date, required this.workOutList});
}
