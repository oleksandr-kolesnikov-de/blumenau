/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:dartz/dartz.dart';

abstract class ExchangeTableExcel {
  Future<Either<Failure, List<CourtModel>>> loadCourts();
}

class ExchangeTableExcelImpl implements ExchangeTableExcel {
  ExchangeTableExcelImpl();

  @override
  Future<Either<Failure, List<CourtModel>>> loadCourts() {
    try {
      return Future.value(const Right([
        CourtModel(name: "Court 1", key: "court1"),
        CourtModel(name: "Court 2", key: "court2"),
        CourtModel(name: "Court 3", key: "court3"),
        CourtModel(name: "Court 4", key: "court4"),
      ]));
    } catch (e) {
      return Future.value(Left(ServerFailure()));
    }
  }
}
