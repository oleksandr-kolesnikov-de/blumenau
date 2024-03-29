/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:dartz/dartz.dart';

// [UseCase] is an abstract class that contains the list of all possible use cases.
// It is used to handle use cases in the application.

abstract class UseCase<Type, Params> {
  Future<Either<Failure, Type>> call(Params params);
}
