/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';

class LoadCourts implements UseCase<List<Court>, NoParams> {
  final TableRepository repository;

  LoadCourts(this.repository);

  @override
  Future<Either<Failure, List<Court>>> call(NoParams params) async {
    return await repository.loadCourts();
  }
}
