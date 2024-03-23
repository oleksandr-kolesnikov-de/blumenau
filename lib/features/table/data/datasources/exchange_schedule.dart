/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:dartz/dartz.dart';

// [ExchangeSchedule] is an abstract class that contains methods to work with the table.

abstract class ExchangeSchedule {
  Future<Either<Failure, List<ScheduleItem>>> loadSchedule(String courtKey);
  Future<Either<Failure, void>> addEntry(
      String courtKey, ScheduleItem scheduleItem);
  Future<Either<Failure, void>> deleteEntry(
      String courtKey, String key, String name);
}
