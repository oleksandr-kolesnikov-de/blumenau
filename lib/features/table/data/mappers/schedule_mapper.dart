/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/data/models/schedule_item_model.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [ScheduleMapper] is a class that contains methods to convert [Schedule] objects
// to [ScheduleItemHiveModel] objects and vice versa.

class ScheduleMapper {
  static List<ScheduleItemModel> toModel(Schedule schedule) {
    final List<ScheduleItemModel> modelList = [];
    for (final appointment in schedule.appointments!) {
      modelList.add(
        ScheduleItemHiveModel(
          key: appointment.key!,
          title: appointment.subject!,
          startTime: appointment.startTime!,
          endTime: appointment.endTime!,
        ),
      );
    }
    return modelList;
  }

  static Schedule fromModel(List<ScheduleItemModel> model) {
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
