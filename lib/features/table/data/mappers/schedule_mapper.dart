/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [ScheduleMapper] is a class that contains methods to convert [Schedule] objects
// to [ScheduleItemHiveModel] objects and vice versa.

class ScheduleMapper {
  static Schedule fromModel(List<ScheduleItem> model) {
    final List<Appointment> appointments = [];
    final List<String> keys = [];
    for (final scheduleItem in model) {
      appointments.add(
        Appointment(
          startTime: scheduleItem.startTime,
          endTime: scheduleItem.endTime,
          subject: scheduleItem.title,
        ),
      );
      keys.add(scheduleItem.key);
    }
    return Schedule(appointments, keys);
  }
}
