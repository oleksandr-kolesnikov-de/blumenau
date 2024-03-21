/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:equatable/equatable.dart';

// [Failure] is an abstract class that contains the list of all possible errors.
// It is used to handle errors in the application.
// [HiveFailure] is a class that represents a server error.
// [CacheFailure] is a class that represents a cache error.

abstract class Failure extends Equatable {
  @override
  List<Object> get props => [];
}

class HiveFailure extends Failure {}

class ExcelFailure extends Failure {}
