/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Model for Hive database

import 'package:hive/hive.dart';

part 'schedule_item_hive_model.g.dart';

@HiveType(typeId: 0)
class ScheduleItemHiveModel {
  @HiveField(0)
  late String key;

  @HiveField(1)
  late String title;

  @HiveField(2)
  late DateTime startTime;

  @HiveField(3)
  late DateTime endTime;

  ScheduleItemHiveModel({
    required this.key,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
