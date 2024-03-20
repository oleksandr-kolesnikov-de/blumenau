/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

// [DeleteEntry] is a use case that deletes an entry from the table.
// It uses the [TableRepository] to delete the entry.
// It returns a [bool] if the entry was deleted successfully.
// It uses the [DeleteEntryParams] to get the court key, pin code and key of the entry to delete.

class DeleteEntry implements UseCase<bool, DeleteEntryParams> {
  final TableRepository repository;

  DeleteEntry(this.repository);

  @override
  Future<Either<Failure, bool>> call(DeleteEntryParams params) async {
    return await repository.deleteEntry(
        params.courtKey, params.pinCode, params.key);
  }
}

class DeleteEntryParams {
  final String courtKey;
  final String pinCode;
  final String key;

  DeleteEntryParams(
      {required this.courtKey, required this.pinCode, required this.key});
}
