/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

// [LoadCourts] is a use case that loads the list of courts.
// It uses the [TableRepository] to get the data.
// It returns a list of [Court] objects or a [Failure].

class LoadCourts implements UseCase<List<Court>, NoParams> {
  final TableRepository repository;

  LoadCourts(this.repository);

  @override
  Future<Either<Failure, List<Court>>> call(NoParams params) async {
    return await repository.loadCourts();
  }
}
