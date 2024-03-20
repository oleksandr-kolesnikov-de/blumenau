/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:syncfusion_flutter_calendar/calendar.dart';

// [Schedule] is a class that contains the schedule of the court.

class Schedule extends CalendarDataSource {
  Schedule(List<Appointment> source) {
    appointments = source;
  }
}
