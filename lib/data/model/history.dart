import 'package:fit_flow/data/model/date.dart';
import 'package:fit_flow/data/model/workout.dart';

class History {
  final Date date;
  final Map<String, WorkOut> workOutList;

  History({required this.date, required this.workOutList});
}
