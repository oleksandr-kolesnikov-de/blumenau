/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [BlumenauDimension] is a class that contains all the dimensions used in the application.

import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:flutter/material.dart';

class BlumenauDimension {
  static const double linearIndicatorHeight = 2;
  static const double headerPageViewHeight = 182;
  static const double smallSpace = 100;
  static const double normalSpace = 200;
  static const double bigSpace = 300;
  static double courtWidgetHeight(BuildContext context) =>
      MediaQuery.of(context).size.height -
      BlumenauDimension.normalSpace -
      BlumenauPadding.normalPadding * 2 -
      BlumenauTextStyle.headline.fontSize!;
  static double courtWidgetWidth(BuildContext context) =>
      MediaQuery.of(context).size.width / PageViewConfig.instance.itemsPerPage;
}
