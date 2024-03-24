/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [PageViewConfig] is a class that contains all the configurations used in the page view.

import 'dart:io';

class PageViewConfig {
  static final itemsPerPage =
      (Platform.isWindows || Platform.isMacOS || Platform.isLinux) ? 3 : 1;
}
