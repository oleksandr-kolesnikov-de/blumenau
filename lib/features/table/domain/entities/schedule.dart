/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:syncfusion_flutter_calendar/calendar.dart';

class Schedule extends CalendarDataSource {
  Schedule(List<Appointment> source) {
    appointments = source;
  }
}
