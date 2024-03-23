/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [ScheduleItemModel] is a class that contains the schedule of one reservation.

abstract class ScheduleItemModel {
  late String key;
  late String title;
  late DateTime startTime;
  late DateTime endTime;
  ScheduleItemModel({
    required this.key,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
