/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:syncfusion_flutter_calendar/calendar.dart';

// [Schedule] is a class that contains the schedule of the court.

class Schedule extends CalendarDataSource {
  List<String> keys;
  Schedule(List<Appointment> source, this.keys) {
    appointments = source;
  }
}
