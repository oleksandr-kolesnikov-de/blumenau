/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/domain/entities/schedule_item.dart';

// [ScheduleItemFactory] is an abstract class that contains a method to create
// a new instance of [ScheduleItem].

abstract class ScheduleItemFactory {
  ScheduleItem createScheduleItem({
    required String key,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
  });
}
