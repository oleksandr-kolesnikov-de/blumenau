/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_club_data.dart';
import 'package:blumenau/features/table/data/models/court_model.dart';
import 'package:dartz/dartz.dart';

// Implementation of the [ExchangeClubData] interface.
// with hardocoded data.

class ExchangeClubDataHardcodedImpl implements ExchangeClubData {
  ExchangeClubDataHardcodedImpl();

  Map<String, String> hardcodedPlayersData = const {
    "Roger Federer": "1234",
    "Raphael Nadal": "4321",
    "Novak Djokovic": "1111",
    "Andy Murray": "2222",
  };

  Map<String, String> hardcodedCourtsData = const {
    "Court 1": "court1",
    "Court 2": "court2",
    "Court 3": "court3",
    "Court 4": "court4",
    "Court 5": "court5",
    "Court 6": "court6",
    "M1": "m1",
    "M2": "m2",
    "M3": "m3",
  };

  @override
  Future<Either<Failure, List<CourtModel>>> loadCourts() {
    try {
      return Future.value(Right(hardcodedCourtsData.entries
          .map((entry) => CourtModel(name: entry.key, key: entry.value))
          .toList()));
    } catch (e) {
      return Future.value(Left(GeneralFailure()));
    }
  }

  @override
  Future<Either<Failure, bool>> tryPin(String pin) {
    try {
      if (hardcodedPlayersData.containsValue(pin)) {
        return Future.value(const Right(true));
      } else {
        return Future.value(const Right(false));
      }
    } catch (e) {
      return Future.value(Left(GeneralFailure()));
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
      return Future.value(Left(GeneralFailure()));
    }
  }
}
