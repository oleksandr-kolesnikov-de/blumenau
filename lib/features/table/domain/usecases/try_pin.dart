/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

class TryPin extends UseCase<bool, TryPinParams> {
  final TableRepository repository;

  TryPin(this.repository);

  @override
  Future<Either<Failure, bool>> call(TryPinParams params) async {
    return await repository.tryPin(params.pin);
  }
}

class TryPinParams extends Equatable {
  final String pin;

  const TryPinParams({required this.pin});

  @override
  List<Object> get props => [pin];
}
