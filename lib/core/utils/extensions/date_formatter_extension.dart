// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

extension DateFormatter on DateTime {
  String? defaultFormat({bool withSecond = true}) {
    // return the "yyyy-MM-dd HH:mm:ss" format
    String? year = this.year.toString();

    String? month = this.month.toString();
    // convert 0, 1, 2, 3, ..., 9 to 00, 01, 02, 03, ..., 09
    if (month.length < 2) {
      month = "0$month";
    }

    String? day = this.day.toString();
    // convert 0, 1, 2, 3, ..., 9 to 00, 01, 02, 03, ..., 09
    if (day.length < 2) {
      day = "0$day";
    }

    String? hour = this.hour.toString();
    // convert 0, 1, 2, 3, ..., 9 to 00, 01, 02, 03, ..., 09
    if (hour.length < 2) {
      hour = "0$hour";
    }

    String? minute = this.minute.toString();
    // convert 0, 1, 2, 3, ..., 9 to 00, 01, 02, 03, ..., 09
    if (minute.length < 2) {
      minute = "0$minute";
    }

    String? second = this.second.toString();
    // convert 0, 1, 2, 3, ..., 9 to 00, 01, 02, 03, ..., 09
    if (second.length < 2) {
      second = "0$second";
    }

    return withSecond ? "$year-$month-$day $hour:$minute:$second" : "$year-$month-$day $hour:$minute";
  }

  String? customFormat(String format) => DateFormat(format).format(this);
}
