/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [ScheduleItem] is a class that contains the schedule of one reservation.

class ScheduleItem {
  final String key;
  final String title;
  final DateTime startTime;
  final DateTime endTime;
  ScheduleItem({
    required this.key,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
