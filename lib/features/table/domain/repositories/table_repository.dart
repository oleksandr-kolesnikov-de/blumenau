/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule_item.dart';
import 'package:dartz/dartz.dart';

//  [TableRepository] is an abstract class that contains methods to work with the table.

abstract class TableRepository {
  Future<Either<Failure, List<ScheduleItem>>> loadSchedule(String courtKey);
  Future<Either<Failure, List<Court>>> loadCourts();
  Future<Either<Failure, bool>> addEntry(
      String courtKey, String pinCode, DateTime startTime, DateTime endTime);
  Future<Either<Failure, bool>> deleteEntry(
      String courtKey, String pincode, String key);
  Future<Either<Failure, bool>> tryPin(String pin);
}
