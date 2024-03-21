/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/style/blumenau_fraction.dart';
import 'package:blumenau/features/table/presentation/widgets/pincode_widget.dart';
import 'package:flutter/material.dart';

// [showPinCodeDialog] is a function that shows a dialog with a [PinCodeWidget] widget.

Future showPinCodeDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return const FractionallySizedBox(
        widthFactor: BlumenauFraction.third,
        child: PinCodeWidget(),
      );
    },
  );
}
