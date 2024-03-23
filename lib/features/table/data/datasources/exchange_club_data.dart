/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:dartz/dartz.dart';

// [ExchangeClubData] is an abstract class that contains methods to work with the table.

abstract class ExchangeClubData {
  Future<Either<Failure, List<Court>>> loadCourts();
  Future<Either<Failure, bool>> tryPin(String pin);
  Future<Either<Failure, String>> getPlayerName(String pin);
}
