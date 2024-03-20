/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

// [AddEntry] is a use case that adds an entry to the schedule of a given court.
// It uses the [TableRepository] to add the entry.
// It returns a [bool] or a [Failure].

class AddEntry implements UseCase<bool, AddEntryParams> {
  final TableRepository repository;

  AddEntry(this.repository);

  @override
  Future<Either<Failure, bool>> call(AddEntryParams params) async {
    return await repository.addEntry(
        params.courtKey, params.pinCode, params.startTime, params.endTime);
  }
}

class AddEntryParams {
  final String courtKey;
  final String pinCode;
  final DateTime startTime;
  final DateTime endTime;

  AddEntryParams(
      {required this.courtKey,
      required this.pinCode,
      required this.startTime,
      required this.endTime});
}
