/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'dart:io';

import 'package:blumenau/core/style/blumanau_transition.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:blumenau/core/style/blumenau_fraction.dart';
import 'package:blumenau/features/table/presentation/widgets/pincode_widget.dart';
import 'package:flutter/material.dart';

// [showPinCodeDialog] is a function that shows a dialog with a [PinCodeWidget] widget.

Future showPinCodeDialog(BuildContext context) async {
  return showGeneralDialog(
    context: context,
    transitionDuration: BlumenauDuration.animationDuration,
    transitionBuilder: BlumenauTransition.normalDialogTransition,
    pageBuilder:
        (BuildContext context, Animation<double> a1, Animation<double> a2) {
      return FractionallySizedBox(
        widthFactor:
            (Platform.isWindows || Platform.isMacOS || Platform.isLinux)
                ? BlumenauFraction.third
                : BlumenauFraction.full,
        child: const PinCodeWidget(),
      );
    },
  );
}
