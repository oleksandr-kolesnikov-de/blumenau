/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_table_excel.dart';
import 'package:blumenau/features/table/data/datasources/exchange_table_hive.dart';
import 'package:blumenau/features/table/data/mappers/court_mapper.dart';
import 'package:blumenau/features/table/data/mappers/schedule_mapper.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

// [TableRepositoryImpl] is a class that implements the [TableRepository] interface.
// It uses the [ExchangeTableHive] and [ExchangeTableExcel] to get the data.

class TableRepositoryImpl implements TableRepository {
  final ExchangeTableHive exchangeTableHive;
  final ExchangeTableExcel exchangeTableExcel;

  TableRepositoryImpl(this.exchangeTableHive, this.exchangeTableExcel);

  @override
  Future<Either<Failure, Schedule>> loadSchedule(String courtKey) async {
    final result = await exchangeTableHive.loadSchedule(courtKey);
    return result.fold(
      (failure) => Left(failure),
      (scheduleItemModels) =>
          Right(ScheduleMapper.fromModel(scheduleItemModels)),
    );
  }

  @override
  Future<Either<Failure, List<Court>>> loadCourts() async {
    final result = await exchangeTableExcel.loadCourts();
    return result.fold(
      (failure) => Left(failure),
      (courtModels) => Right(CourtMapper.fromModel(courtModels)),
    );
  }

  @override
  Future<Either<Failure, bool>> addEntry(String courtKey, String pinCode,
      DateTime startTime, DateTime endTime) async {
    final result1 = await exchangeTableHive.retryPin(pinCode);
    return await result1.fold((failure) async => Left(failure), (right) async {
      final result2 = await exchangeTableHive.addEntry(
          courtKey,
          ScheduleItemHiveModel(
              title: right, startTime: startTime, endTime: endTime));
      return result2.fold(
        (failure) => Left(failure),
        (success) => const Right(true),
      );
    });
  }
}
