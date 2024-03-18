/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:dartz/dartz.dart';

abstract class TableRepository {
  Future<Either<Failure, Schedule>> loadSchedule();
}
