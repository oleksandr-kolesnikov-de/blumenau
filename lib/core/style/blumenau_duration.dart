/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [BlumenauDuration] is a class that contains all the durations used in the application.

class BlumenauDuration {
  static const Duration zeroDuration = Duration.zero;
  static const Duration animationDuration = Duration(milliseconds: 300);
  static const Duration verySmallDuration = Duration(milliseconds: 500);
  static const Duration smallDuration = Duration(seconds: 1);
  static const Duration normalDuration = Duration(seconds: 2);
  static const Duration bigDuration = Duration(seconds: 3);
}
