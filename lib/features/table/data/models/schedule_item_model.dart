/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

class ScheduleItemModel {
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
