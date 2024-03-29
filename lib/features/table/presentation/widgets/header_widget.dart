/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_dimension.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/core/style/blumeneau_format.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

// [HeaderWidget] is a widget that displays the header of the page.
// It uses the [TableState] to get the data and display it.

class HeaderWidget extends StatelessWidget {
  final TableState state;
  const HeaderWidget({
    super.key,
    required this.state,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return Container(
        height: BlumenauDimension.headerPageViewHeight,
        width: MediaQuery.of(context).size.width,
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.all(BlumenauPadding.normalPadding),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: BlumenauPadding.bigPadding),
              if (state is TableLoadingState)
                const LinearProgressIndicator(
                    minHeight: BlumenauDimension.linearIndicatorHeight),
              if (state is! TableLoadingState)
                const SizedBox(height: BlumenauDimension.linearIndicatorHeight),
              const SizedBox(height: BlumenauPadding.normalPadding),
              Text(Literals.clubName, style: BlumenauTextStyle.headline),
              Text(Literals.clubAddress, style: BlumenauTextStyle.headline),
              Text(
                  "${Literals.time}: ${DateFormat(BlumenauFormat.dateFormat).format(DateTime.now())}",
                  style: BlumenauTextStyle.headline),
              Text(
                  "${Literals.temperature}: ${state.temperature}${Literals.celcius}",
                  style: BlumenauTextStyle.headline),
              Text("${Literals.conditions}: ${state.conditions}",
                  style: BlumenauTextStyle.headline),
            ],
          ),
        ),
      );
    });
  }
}
