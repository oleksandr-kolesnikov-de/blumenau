/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/style/blumenau_fraction.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:flutter/material.dart';

// [SplashScreenWidget] is a widget that displays a splash screen.
// It is used to show the logo of the application while the application is loading.

class SplashScreenWidget extends StatelessWidget {
  const SplashScreenWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset('assets/logo.png'),
          Padding(
            padding: const EdgeInsets.only(top: BlumenauPadding.bigPadding * 2),
            child: SizedBox(
                width:
                    MediaQuery.of(context).size.width * BlumenauFraction.sixth,
                child: const LinearProgressIndicator()),
          )
        ],
      ),
    );
  }
}
