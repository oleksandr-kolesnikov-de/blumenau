/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_club_data.dart';
import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:dartz/dartz.dart';

// Implementation of the [ExchangeClubData] interface.
// with MS Excel.

class ExchangeClubDataExcelImpl implements ExchangeClubData {
  ExchangeClubDataExcelImpl();

  Map<String, String> hardcodedPlayersData = const {
    "Roger Federer": "1234",
    "Raphael Nadal": "4321",
    "Novak Djokovic": "1111",
    "Andy Murray": "2222",
  };

  @override
  Future<Either<Failure, List<CourtModel>>> loadCourts() {
    try {
      // No MS Excel implementation yet
      // just hardcode the list of courts
      return Future.value(const Right([
        CourtModel(name: "Court 1", key: "court1"),
        CourtModel(name: "Court 2", key: "court2"),
        CourtModel(name: "Court 3", key: "court3"),
        CourtModel(name: "Court 4", key: "court4"),
        CourtModel(name: "Court 5", key: "court5"),
        CourtModel(name: "Court 6", key: "court6"),
        CourtModel(name: "M1", key: "m1"),
        CourtModel(name: "M2", key: "m2"),
        CourtModel(name: "M3", key: "m3"),
      ]));
    } catch (e) {
      return Future.value(Left(ExcelFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> tryPin(String pin) {
    try {
      // No MS Excel implementation yet
      // just hardcode the pin code
      if (hardcodedPlayersData.containsValue(pin)) {
        return Future.value(const Right(true));
      } else {
        return Future.value(const Right(false));
      }
    } catch (e) {
      return Future.value(Left(ExcelFailure()));
    }
  }

  @override
  Future<Either<Failure, String>> getPlayerName(String pin) {
    try {
      if (hardcodedPlayersData.containsValue(pin)) {
        return Future.value(Right(hardcodedPlayersData.keys
            .firstWhere((key) => hardcodedPlayersData[key] == pin)));
      } else {
        return Future.value(const Right(""));
      }
    } catch (e) {
      return Future.value(Left(ExcelFailure()));
    }
  }
}
