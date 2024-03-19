/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class AddEntry implements UseCase<bool, AddEntryParams> {
  final TableRepository repository;

  AddEntry(this.repository);

  @override
  Future<Either<Failure, bool>> call(AddEntryParams params) async {
    return await repository.addEntry(
        params.pinCode, params.startTime, params.endTime);
  }
}

class AddEntryParams {
  final String pinCode;
  final DateTime startTime;
  final DateTime endTime;

  AddEntryParams(
      {required this.pinCode, required this.startTime, required this.endTime});
}
