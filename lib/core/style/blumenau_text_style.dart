/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:flutter/material.dart';

//  [BlumenauTextStyle] is a class that contains all the text styles used in the application.
//  It is used to avoid hardcoding text styles in the application.

class BlumenauTextStyle {
  static const TextStyle headline = TextStyle(
      color: Colors.black26,
      fontSize: 18,
      decoration: TextDecoration.none,
      fontWeight: FontWeight.bold);
  static const TextStyle pinText = TextStyle(
    fontSize: 22,
    color: Color.fromRGBO(30, 60, 87, 1),
  );
  static const TextStyle errorHeadlineText = TextStyle(
    backgroundColor: Colors.white,
    fontFamily: 'Courier New',
    color: Colors.black26,
    fontSize: 18,
    decoration: TextDecoration.none,
  );
  static const TextStyle errorNormalText = TextStyle(
    fontFamily: 'Courier New',
    color: Colors.white,
    fontSize: 18,
    decoration: TextDecoration.none,
  );
  static const TextStyle courtHeaderStyle = TextStyle(
      color: Colors.white, fontSize: 14, decoration: TextDecoration.none);
}
