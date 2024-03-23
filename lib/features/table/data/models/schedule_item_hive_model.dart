/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// Model for Hive database

import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:hive/hive.dart';

part 'schedule_item_hive_model.g.dart';

@HiveType(typeId: 0)
class ScheduleItemHiveModel implements ScheduleItem {
  @override
  @HiveField(0)
  late String key;

  @override
  @HiveField(1)
  late String title;

  @override
  @HiveField(2)
  late DateTime startTime;

  @override
  @HiveField(3)
  late DateTime endTime;

  ScheduleItemHiveModel({
    required this.key,
    required this.title,
    required this.startTime,
    required this.endTime,
  });
}
