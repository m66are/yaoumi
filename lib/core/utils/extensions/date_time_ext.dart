import 'package:intl/intl.dart';

extension DateTimeExtension on DateTime {
  bool get isToday {
    final DateTime now = DateTime.now();
    return year == now.year && month == now.month && day == now.day;
  }

  bool get isYesterday {
    final DateTime yesterday = DateTime.now().subtract(Duration(days: 1));
    return year == yesterday.year &&
        month == yesterday.month &&
        day == yesterday.day;
  }

  bool get isTomorrow {
    final DateTime tomorrow = DateTime.now().add(Duration(days: 1));
    return year == tomorrow.year &&
        month == tomorrow.month &&
        day == tomorrow.day;
  }

  bool isWithinRange(DateTime start, DateTime end) {
    return isAfter(start) && isBefore(end);
  }

  DateTime get startOfDay {
    return DateTime(year, month, day);
  }

  DateTime get endOfDay {
    return DateTime(year, month, day, 23, 59, 59, 999, 999);
  }

  String get readableFormat {
    final DateFormat formatter = DateFormat('MMMM d, y - hh:mm a');
    return formatter.format(this);
  }

  String get shortDateFormat {
    final DateFormat formatter = DateFormat('MM/dd/yyyy');
    return formatter.format(this);
  }
}
