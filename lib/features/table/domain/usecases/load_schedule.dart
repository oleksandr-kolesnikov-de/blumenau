/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class LoadSchedule implements UseCase<Schedule, NoParams> {
  final TableRepository repository;

  LoadSchedule(this.repository);

  @override
  Future<Either<Failure, Schedule>> call(NoParams params) async {
    return await repository.loadSchedule();
  }
}
