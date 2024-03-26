/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [PageViewConfig] is a class that contains all the configurations used in the page view.

class PageViewConfig {
  static PageViewConfig instance = PageViewConfig._internal();
  PageViewConfig._internal();
  int itemsPerPage = 1;
}
