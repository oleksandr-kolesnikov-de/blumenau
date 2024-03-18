/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:dartz/dartz.dart';
import 'package:shared_preferences/shared_preferences.dart';

abstract class ExchangeTableSharedPrefs {
  Future<Either<Failure, Schedule>> loadSchedule();
}

class ExchangeTableSharedPrefsImpl implements ExchangeTableSharedPrefs {
  final SharedPreferences sharedPreferences;
  ExchangeTableSharedPrefsImpl(this.sharedPreferences);

  @override
  Future<Either<Failure, Schedule>> loadSchedule() {
    try {
      return Future.value(Right(Schedule([])));
    } catch (e) {
      return Future.value(Left(ServerFailure()));
    }
  }
}
