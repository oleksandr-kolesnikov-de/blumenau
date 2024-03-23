/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/utils/utils.dart';
import 'package:blumenau/features/table/data/datasources/exchange_club_data.dart';
import 'package:blumenau/features/table/data/datasources/exchange_schedule.dart';
import 'package:blumenau/features/table/data/mappers/schedule_mapper.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

// [TableRepositoryImpl] is a class that implements the [TableRepository] interface.
// It uses the [ExchangeSchedule] and [ExchangeClubData] to get the data.

class TableRepositoryImpl implements TableRepository {
  final ExchangeSchedule exchangeSchedule;
  final ExchangeClubData exchangeClubData;

  TableRepositoryImpl(this.exchangeSchedule, this.exchangeClubData);

  @override
  Future<Either<Failure, Schedule>> loadSchedule(String courtKey) async {
    final result = await exchangeSchedule.loadSchedule(courtKey);
    return result.fold(
      (failure) => Left(failure),
      (scheduleItemModels) =>
          Right(ScheduleMapper.fromModel(scheduleItemModels)),
    );
  }

  @override
  Future<Either<Failure, List<Court>>> loadCourts() async {
    final result = await exchangeClubData.loadCourts();
    return result.fold(
      (failure) => Left(failure),
      (courtModels) => Right(courtModels),
    );
  }

  @override
  Future<Either<Failure, bool>> addEntry(String courtKey, String pinCode,
      DateTime startTime, DateTime endTime) async {
    final result1 = await exchangeClubData.getPlayerName(pinCode);
    return await result1.fold((failure) async => Left(failure), (right) async {
      final result2 = await exchangeSchedule.addEntry(
          courtKey,
          ScheduleItemHiveModel(
              key: Utils.getRandomString(10),
              title: right,
              startTime: startTime,
              endTime: endTime));
      return result2.fold(
        (failure) => Left(failure),
        (success) => const Right(true),
      );
    });
  }

  @override
  Future<Either<Failure, bool>> deleteEntry(
      String courtKey, String pinCode, String key) async {
    final result1 = await exchangeClubData.getPlayerName(pinCode);
    return await result1.fold((failure) async => Left(failure), (right) async {
      final result2 = await exchangeSchedule.deleteEntry(courtKey, key, right);
      return result2.fold(
        (failure) => Left(failure),
        (success) => const Right(true),
      );
    });
  }

  @override
  Future<Either<Failure, bool>> tryPin(String pin) async {
    final result = await exchangeClubData.tryPin(pin);
    return result.fold(
      (failure) => Left(failure),
      (success) => Right(success),
    );
  }
}
