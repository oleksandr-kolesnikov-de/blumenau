/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/keys/widget_keys.dart';
import 'package:blumenau/core/widgets/splash_screen_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

// [SplashScreenWidget] test
// Checks wether logo and progress indicator rednered correctly
void main() {
  testWidgets('Checks wether logo and progress indicator rednered correctly',
      (WidgetTester tester) async {
    // arrange

    await tester.pumpWidget(const MaterialApp(
      home: SplashScreenWidget(),
    ));

    // test

    var result1 = find.byKey(const Key(WidgetKey.splashScreenLogo));
    var result2 = find.byKey(const Key(WidgetKey.splashScreenIdicator));

    // verify

    expect(result1, findsOneWidget);
    expect(result2, findsOneWidget);
  });
}
