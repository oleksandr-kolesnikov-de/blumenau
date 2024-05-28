/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [PageViewConfig] is a class that contains all the configurations used in the page view.

class PageViewConfig {
  static PageViewConfig instance = PageViewConfig._internal();
  PageViewConfig._internal();
  int itemsPerPage = 1;
  final int pagesPortrait = 1;
  final int pagesLandscape = 2;
  final double distanceSensitivity = 50.0;
  final double velocitySensitivity = 5.0;
}
