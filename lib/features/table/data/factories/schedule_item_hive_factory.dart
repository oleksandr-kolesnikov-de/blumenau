import 'package:blumenau/features/table/data/factories/schedule_item_factory.dart';
import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';

class ScheduleItemHiveFactory implements ScheduleItemFactory {
  @override
  ScheduleItem createScheduleItem({
    required String key,
    required String title,
    required DateTime startTime,
    required DateTime endTime,
  }) {
    return ScheduleItemHiveModel(
      key: key,
      title: title,
      startTime: startTime,
      endTime: endTime,
    );
  }
}
