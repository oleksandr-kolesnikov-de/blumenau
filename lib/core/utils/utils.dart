/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:path_provider/path_provider.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [Utils] is a class that contains methods to work with date and time.
// [getTimePlusHour] returns the date and time that is one hour later than the
// date and time from the [details] parameter.
// [getTodaysMinTime] returns the date and time of the current day with the
// time set to the current hour + 1.
// [getTodaysMaxTime] returns the date and time of the current day with the
// time set to 22:00.
// [getWorkingHours] returns the working hours for the calendar.
// [getRandomString] returns a random string of the specified [length].
// [getPath] returns the path to the application directory.

class Utils {
  static DateTime getTimePlusHour(CalendarTapDetails details) => DateTime(
      details.date?.year ?? 1990,
      details.date?.month ?? 1,
      details.date?.day ?? 1,
      (details.date?.hour ?? 1) + 1,
      details.date?.minute ?? 0,
      0);

  static DateTime getTodaysMinTime() => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      min(DateTime.now().hour + 1, 21),
      0,
      0);

  static DateTime getCurrentHourStartTime() => DateTime(
      DateTime.now().year,
      DateTime.now().month,
      DateTime.now().day,
      min(DateTime.now().hour, 21),
      0,
      0);

  static DateTime getTodaysMaxTime() => DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 0, 0);

  static TimeSlotViewSettings getWorkingHours() => const TimeSlotViewSettings(
      timeFormat: 'HH:mm', startHour: 8, endHour: 22, nonWorkingDays: <int>[]);

  static String getRandomString(int length) {
    const chars =
        'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789';
    final rnd = Random(DateTime.now().millisecondsSinceEpoch);
    final buf = StringBuffer();
    for (var i = 0; i < length; i++) {
      buf.write(chars[rnd.nextInt(chars.length)]);
    }
    return buf.toString();
  }

  static Future<String> getPath() async {
    String path;
    if (kIsWeb) {
      path = "/assets/db";
      return path;
    } else {
      var dir = await getApplicationDocumentsDirectory();
      path = dir.path;
      return path;
    }
  }
}
