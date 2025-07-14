import 'dart:convert';

import 'package:fit_flow/data/model/time.dart';

class WorkOut {
  final int? rep;
  final int? set;
  final Time? time;

  WorkOut({this.rep, this.set, this.time});

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'rep': rep, 'set': set, 'time': time?.toMap()};
  }

  factory WorkOut.fromMap(Map<String, dynamic> map) {
    return WorkOut(
      rep: map['rep'] != null ? map['rep'] as int : null,
      set: map['set'] != null ? map['set'] as int : null,
      time: map['time'] != null
          ? Time.fromMap(map['time'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory WorkOut.fromJson(String source) =>
      WorkOut.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'WorkOut(, rep: $rep, set: $set, time: $time)';
  }

  @override
  bool operator ==(covariant WorkOut other) {
    if (identical(this, other)) return true;

    return other.rep == rep && other.set == set && other.time == time;
  }

  @override
  int get hashCode {
    return rep.hashCode ^ set.hashCode ^ time.hashCode;
  }
}
