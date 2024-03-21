/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/style/blumenau_color.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';

class BlumenauTheme {
  static PinTheme pinTheme = PinTheme(
    width: 56,
    height: 56,
    textStyle: BlumenauTextStyle.pinText,
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(19),
      border: Border.all(color: BlumenauColor.pinBorderColor),
    ),
  );
}
