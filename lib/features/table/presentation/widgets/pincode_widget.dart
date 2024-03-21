/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

// [PinCodeWidget] is a widget that displays a pin code input field.
// It uses the [PinTheme] to style the input field.

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({super.key});

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    context.read<TableBloc>().add(ResetPinCodeTableEvent());
    focusNode.requestFocus();
  }

  @override
  void dispose() {
    pinController.dispose();
    focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    const focusedBorderColor = Color.fromRGBO(23, 171, 144, 1);
    const fillColor = Color.fromRGBO(243, 246, 249, 0);
    const borderColor = Color.fromRGBO(23, 171, 144, 0.4);

    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: const TextStyle(
        fontSize: 22,
        color: Color.fromRGBO(30, 60, 87, 1),
      ),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(19),
        border: Border.all(color: borderColor),
      ),
    );

    return Material(
      child: Form(
        key: formKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Directionality(
              textDirection: TextDirection.ltr,
              child: Pinput(
                controller: pinController,
                focusNode: focusNode,
                androidSmsAutofillMethod:
                    AndroidSmsAutofillMethod.smsUserConsentApi,
                listenForMultipleSmsOnAndroid: true,
                defaultPinTheme: defaultPinTheme,
                separatorBuilder: (index) =>
                    const SizedBox(width: BlumenauPadding.smallPadding),
                hapticFeedbackType: HapticFeedbackType.lightImpact,
                cursor: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(
                          bottom: BlumenauPadding.smallPadding),
                      width: 22,
                      height: 1,
                      color: focusedBorderColor,
                    ),
                  ],
                ),
                onCompleted: (value) {
                  context
                      .read<TableBloc>()
                      .add(TryPinCodeTableEvent(pinCode: value.toString()));
                },
                focusedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    borderRadius: BorderRadius.circular(8),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                submittedPinTheme: defaultPinTheme.copyWith(
                  decoration: defaultPinTheme.decoration!.copyWith(
                    color: fillColor,
                    borderRadius: BorderRadius.circular(19),
                    border: Border.all(color: focusedBorderColor),
                  ),
                ),
                errorPinTheme: defaultPinTheme.copyBorderWith(
                  border: Border.all(color: Colors.redAccent),
                ),
              ),
            ),
            BlocBuilder<TableBloc, TableState>(builder: (context, state) {
              return TextButton(
                onPressed: () {
                  if (state.pinVerified) {
                    focusNode.unfocus();
                    Navigator.of(context).pop(pinController.text);
                  } else {
                    pinController.clear();
                  }
                },
                child: Text(Literals.accept),
              );
            }),
          ],
        ),
      ),
    );
  }
}
