import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ErrorScreenWidget extends StatelessWidget {
  const ErrorScreenWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {
          context.read<TableBloc>().add(const LoadScheduleTableEvent(null));
        },
        child: Ink(
          color: Colors.blue,
          child: Container(
              color: Colors.blue,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(Literals.error,
                        style: BlumenauTextStyle.errorHeadlineText),
                    Text(Literals.pressAnyKey,
                        style: BlumenauTextStyle.errorNormalText),
                  ],
                ),
              )),
        ),
      ),
    );
  }
}
