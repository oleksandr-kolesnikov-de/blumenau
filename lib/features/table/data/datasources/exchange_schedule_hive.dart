/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_schedule.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/data/models/schedule_item_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

// It is implemented by [ExchangeScheduleHiveImpl] class.
// [ExchangeScheduleHiveImpl] class contains methods to work with the table in the Hive database.

class ExchangeScheduleHiveImpl implements ExchangeSchedule {
  ExchangeScheduleHiveImpl();

  @override
  Future<Either<Failure, List<ScheduleItemHiveModel>>> loadSchedule(
      String courtKey) async {
    try {
      var box = await Hive.openBox(courtKey);
      List<dynamic> allRecords = box.values.toList();
      return Future.value(Right(allRecords.cast<ScheduleItemHiveModel>()));
    } catch (e) {
      return Future.value(Left(HiveFailure()));
    }
  }

  @override
  Future<Either<Failure, void>> addEntry(
      String courtKey, ScheduleItemModel scheduleItem) async {
    try {
      var box = await Hive.openBox(courtKey);
      await box.put(scheduleItem.key, scheduleItem);
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(HiveFailure()));
    }
  }

  @override
  Future<Either<Failure, void>> deleteEntry(
      String courtKey, String key, String name) async {
    try {
      var box = await Hive.openBox(courtKey);
      ScheduleItemHiveModel entry = await box.get(key);
      if (entry.title == name) {
        await box.delete(key);
      }
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(HiveFailure()));
    }
  }
}
