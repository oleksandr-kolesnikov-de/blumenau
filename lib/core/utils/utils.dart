/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:syncfusion_flutter_calendar/calendar.dart';

// [Utils] is a class that contains methods to work with date and time.

class Utils {
  static DateTime getTimePlusHour(CalendarTapDetails details) => DateTime(
      details.date?.year ?? 1990,
      details.date?.month ?? 1,
      details.date?.day ?? 1,
      (details.date?.hour ?? 1) + 1,
      details.date?.minute ?? 0,
      0);

  static DateTime getTodaysMinTime() => DateTime(DateTime.now().year,
      DateTime.now().month, DateTime.now().day, DateTime.now().hour + 1, 0, 0);

  static DateTime getTodaysMaxTime() => DateTime(
      DateTime.now().year, DateTime.now().month, DateTime.now().day, 22, 0, 0);

  static TimeSlotViewSettings getWorkingHours() => const TimeSlotViewSettings(
      timeFormat: 'HH:mm', startHour: 8, endHour: 22, nonWorkingDays: <int>[]);
}
