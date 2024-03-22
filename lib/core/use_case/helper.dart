/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [Helper] is an abstract class that contains the list of all possible helpers.

abstract class Helper<Type, Params> {
  Type call(Params params);
}
