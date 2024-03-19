/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:hive/hive.dart';

part 'schedule_item_hive_model.g.dart';

@HiveType(typeId: 0)
class ScheduleItemHiveModel {
  @HiveField(0)
  late String title;

  @HiveField(1)
  late DateTime startTime;

  @HiveField(2)
  late DateTime endTime;

  ScheduleItemHiveModel({
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
