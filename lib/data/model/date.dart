class Date {
  final int day;
  final int month;
  final int year;

  // Month names
  static const List<String> monthNames = [
    'January',
    'February',
    'March',
    'April',
    'May',
    'June',
    'July',
    'August',
    'September',
    'October',
    'November',
    'December',
  ];

  Date({required this.day, required this.month, required this.year}) {
    if (year < 1) throw ArgumentError('Year must be positive');
    if (month < 1 || month > 12) throw ArgumentError('Month must be 1-12');
    if (day < 1 || day > _daysInMonth(month, year)) {
      throw ArgumentError('Invalid day for month/year');
    }
  }
  // Factory constructor for current date
  factory Date.now([int difDay = 0, int difMonth = 0, int difYear = 0]) {
    final now = DateTime.now();
    return Date(
      day: now.day - (difDay),
      month: now.month - (difMonth),
      year: now.year - (difYear),
    );
  }

  // You can also add other useful factory constructors
  factory Date.fromDateTime(DateTime dateTime) {
    return Date(day: dateTime.day, month: dateTime.month, year: dateTime.year);
  }

  @override
  String toString() {
    final String dayStr = day.toString().padLeft(2, '0');
    return '$dayStr ${monthNames[month - 1]} $year';
  }

  // Helper methods
  static int _daysInMonth(int month, int year) {
    if (month == 2) return _isLeapYear(year) ? 29 : 28;
    const daysInMonth = [0, 31, 0, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31];
    return daysInMonth[month];
  }

  static bool _isLeapYear(int year) {
    return (year % 4 == 0) && ((year % 100 != 0) || (year % 400 == 0));
  }
}
