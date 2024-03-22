/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/config/pin_widget_config.dart';
import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_color.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_theme.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pinput/pinput.dart';

// [PinCodeWidget] is a widget that displays a pin code input field.
// to confirm changes in the table.

class PinCodeWidget extends StatefulWidget {
  const PinCodeWidget({super.key});

  @override
  State<PinCodeWidget> createState() => _PinCodeWidgetState();
}

class _PinCodeWidgetState extends State<PinCodeWidget> {
  final pinController = TextEditingController();
  final focusNode = FocusNode();

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
    return Material(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Pin code input field
          Directionality(
            textDirection: TextDirection.ltr,
            child: Pinput(
              controller: pinController,
              focusNode: focusNode,
              androidSmsAutofillMethod:
                  AndroidSmsAutofillMethod.smsUserConsentApi,
              listenForMultipleSmsOnAndroid: true,
              defaultPinTheme: BlumenauTheme.pinTheme,
              separatorBuilder: (index) =>
                  const SizedBox(width: BlumenauPadding.smallPadding),
              hapticFeedbackType: HapticFeedbackType.lightImpact,
              cursor: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      margin: const EdgeInsets.only(
                          bottom: BlumenauPadding.smallPadding),
                      width: PinWidgetConfig.cursorWidth,
                      height: PinWidgetConfig.cursorHeight,
                      color: BlumenauColor.pinFocusedBorderColor),
                ],
              ),
              onCompleted: (value) {
                context
                    .read<TableBloc>()
                    .add(TryPinCodeTableEvent(pinCode: value.toString()));
              },
              focusedPinTheme: BlumenauTheme.pinTheme.copyWith(
                decoration: BlumenauTheme.pinTheme.decoration!.copyWith(
                  borderRadius: BorderRadius.circular(
                      PinWidgetConfig.borderRadiusFocused),
                  border:
                      Border.all(color: BlumenauColor.pinFocusedBorderColor),
                ),
              ),
              submittedPinTheme: BlumenauTheme.pinTheme.copyWith(
                decoration: BlumenauTheme.pinTheme.decoration!.copyWith(
                  color: BlumenauColor.pinFillColor,
                  borderRadius: BorderRadius.circular(
                      PinWidgetConfig.borderRadiusUnfocused),
                  border: Border.all(color: BlumenauColor.pinBorderColor),
                ),
              ),
              errorPinTheme: BlumenauTheme.pinTheme.copyBorderWith(
                  border: Border.all(color: BlumenauColor.pinErrorColor)),
            ),
          ),
          // Buttons to cancel or accept the pin code
          BlocBuilder<TableBloc, TableState>(builder: (context, state) {
            return Padding(
              padding: const EdgeInsets.only(top: BlumenauPadding.bigPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Cancel button
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text(Literals.cancel),
                  ),
                  const SizedBox(width: BlumenauPadding.smallPadding),
                  // Accept button
                  TextButton(
                    onPressed: () {
                      if (state.pinVerified) {
                        focusNode.unfocus();
                        Navigator.of(context).pop(pinController.text);
                      } else {
                        pinController.clear();
                      }
                    },
                    child: Text(Literals.accept),
                  ),
                ],
              ),
            );
          }),
        ],
      ),
    );
  }
}
