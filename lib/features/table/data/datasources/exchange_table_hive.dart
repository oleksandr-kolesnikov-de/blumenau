/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:dartz/dartz.dart';
import 'package:hive/hive.dart';

abstract class ExchangeTableHive {
  Future<Either<Failure, List<ScheduleItemHiveModel>>> loadSchedule();
  Future<Either<Failure, String>> retryPin(String pinCode);
  Future<Either<Failure, void>> addEntry(
      ScheduleItemHiveModel scheduleItemIsarModel);
}

class ExchangeTableHiveImpl implements ExchangeTableHive {
  ExchangeTableHiveImpl();

  @override
  Future<Either<Failure, List<ScheduleItemHiveModel>>> loadSchedule() async {
    try {
      var box = await Hive.openBox("schedule");
      List<dynamic> allRecords = box.values.toList();
      return Future.value(Right(allRecords.cast<ScheduleItemHiveModel>()));
    } catch (e) {
      return Future.value(Left(ServerFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> retryPin(String pinCode) {
    try {
      return Future.value(const Right("Some player"));
    } catch (e) {
      return Future.value(Left(ServerFailure()));
    }
  }

  @override
  Future<Either<Failure, void>> addEntry(
      ScheduleItemHiveModel scheduleItemHiveModel) async {
    try {
      var box = await Hive.openBox("schedule");
      await box.add(scheduleItemHiveModel);
      return Future.value(const Right(null));
    } catch (e) {
      return Future.value(Left(ServerFailure()));
    }
  }
}
