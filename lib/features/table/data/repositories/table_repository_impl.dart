/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_table_shared_prefs.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class TableRepositoryImpl implements TableRepository {
  final ExchangeTableSharedPrefs exchangeTablesharedPrefs;

  TableRepositoryImpl(this.exchangeTablesharedPrefs);

  @override
  Future<Either<Failure, Schedule>> loadSchedule() async {
    return await _loadSchedule();
  }

  Future<Either<Failure, Schedule>> _loadSchedule() async {
    return await exchangeTablesharedPrefs.loadSchedule();
  }
}
