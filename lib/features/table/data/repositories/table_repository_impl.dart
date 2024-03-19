/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/features/table/data/datasources/exchange_table_hive.dart';
import 'package:blumenau/features/table/data/mappers/schedule_mapper.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class TableRepositoryImpl implements TableRepository {
  final ExchangeTableHive exchangeTableHive;

  TableRepositoryImpl(this.exchangeTableHive);

  @override
  Future<Either<Failure, Schedule>> loadSchedule() async {
    final result = await exchangeTableHive.loadSchedule();
    return result.fold(
      (failure) => Left(failure),
      (scheduleItemModels) =>
          Right(ScheduleMapper.fromModel(scheduleItemModels)),
    );
  }

  @override
  Future<Either<Failure, bool>> addEntry(
      String pinCode, DateTime startTime, DateTime endTime) async {
    final result1 = await exchangeTableHive.retryPin(pinCode);
    return await result1.fold((failure) async => Left(failure), (right) async {
      final result2 = await exchangeTableHive.addEntry(ScheduleItemHiveModel(
          title: right, startTime: startTime, endTime: endTime));
      return result2.fold(
        (failure) => Left(failure),
        (success) => const Right(true),
      );
    });
  }
}
