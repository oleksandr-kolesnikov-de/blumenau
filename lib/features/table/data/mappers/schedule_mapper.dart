/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class ScheduleMapper {
  static List<ScheduleItemHiveModel> toModel(Schedule schedule) {
    final List<ScheduleItemHiveModel> modelList = [];
    for (final appointment in schedule.appointments!) {
      modelList.add(
        ScheduleItemHiveModel(
          title: appointment.subject!,
          startTime: appointment.startTime!,
          endTime: appointment.endTime!,
        ),
      );
    }
    return modelList;
  }

  static Schedule fromModel(List<ScheduleItemHiveModel> model) {
    final List<Appointment> appointments = [];
    for (final scheduleItem in model) {
      appointments.add(
        Appointment(
          startTime: scheduleItem.startTime,
          endTime: scheduleItem.endTime,
          subject: scheduleItem.title,
        ),
      );
    }
    return Schedule(appointments);
  }
}
