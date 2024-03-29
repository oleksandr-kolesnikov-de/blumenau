/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/style/blumenau_dimension.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';

// [BodyWidget] is a widget that displays a list of [CourtWidget] widgets.
// It uses the [TableState] to get the data and display it.

class BodyWidget extends StatelessWidget {
  final TableState state;
  const BodyWidget({
    super.key,
    required this.state,
    required this.pageController,
  });

  final PageController pageController;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: BlumenauDimension.headerPageViewHeight,
      ),
      child: PageView.builder(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        pageSnapping: false,
        itemCount: state.pageCount,
        itemBuilder: (context, page) {
          return Row(
            children: List.generate(
              state.endIndex(page) - state.startIndex(page),
              (i) => CourtWidget(
                court: state.courts[state.startIndex(page) + i],
                schedule: state.schedule[state.startIndex(page) + i],
                pageController: pageController,
                pageIndex: page,
              ),
            ),
          );
        },
      ),
    );
  }
}
