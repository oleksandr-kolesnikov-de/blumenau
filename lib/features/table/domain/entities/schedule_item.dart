/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [ScheduleItem] is a class that contains the schedule of one reservation.

abstract class ScheduleItem {
  late String key;
  late String title;
  late DateTime startTime;
  late DateTime endTime;
  ScheduleItem({
    required this.key,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
