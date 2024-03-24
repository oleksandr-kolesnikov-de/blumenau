import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:flutter/material.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.blue,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(Literals.error, style: BlumenauTextStyle.errorText),
              Text(Literals.pressAnyKey, style: BlumenauTextStyle.errorText),
            ],
          ),
        ));
  }
}
