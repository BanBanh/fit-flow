import 'dart:convert';

class Time {
  final int second;

  Time({required this.second});

  @override
  String toString() => 'Time(second: $second)';

  Time copyWith({int? second}) {
    return Time(second: second ?? this.second);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'second': second};
  }

  factory Time.fromMap(Map<String, dynamic> map) {
    return Time(second: map['second'] as int);
  }

  String toJson() => json.encode(toMap());

  factory Time.fromJson(String source) =>
      Time.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  bool operator ==(covariant Time other) {
    if (identical(this, other)) return true;

    return other.second == second;
  }

  @override
  int get hashCode => second.hashCode;
}
