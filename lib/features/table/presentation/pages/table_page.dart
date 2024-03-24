/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:blumenau/core/widgets/splash_screen_widget.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// [TablePage] is a widget that displays a list of [CourtWidget] widgets.
// It uses the [TableBloc] to get the data and display it.

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  TablePageState createState() => TablePageState();
}

class TablePageState extends State<TablePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(builder: (context, state) {
      if (state is TableInitialState) {
        return const SplashScreenWidget();
      } else if (state is TableErrorState) {
        return Center(
          child: Text(Literals.error),
        );
      } else if (state is TableLoadingState) {
        return const SplashScreenWidget();
      } else if (state is TableLoadedState) {
        final List<CourtWidget> courtWidgets =
            state.courts.asMap().entries.map((entry) {
          return CourtWidget(
            court: entry.value,
            schedule: state.schedule[entry.key],
          );
        }).toList();
        final pageCount =
            (courtWidgets.length / PageViewConfig.itemsPerPage).ceil();
        return Container(
          color: Colors.white,
          child: Stack(
            children: [
              PageView.builder(
                controller: pageController,
                itemCount: pageCount,
                itemBuilder: (context, pageIndex) {
                  final startIndex = pageIndex * PageViewConfig.itemsPerPage;
                  final endIndex = (startIndex + PageViewConfig.itemsPerPage)
                      .clamp(0, courtWidgets.length);
                  final pageWidgets =
                      courtWidgets.sublist(startIndex, endIndex);
                  return Row(
                    children: pageWidgets,
                  );
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      pageController.previousPage(
                        duration: BlumenauDuration.animationDuration,
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                  IconButton(
                    icon: const Icon(Icons.arrow_forward),
                    onPressed: () {
                      pageController.nextPage(
                        duration: BlumenauDuration.animationDuration,
                        curve: Curves.easeInOut,
                      );
                    },
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        return Center(
          child: Text(Literals.unknownState),
        );
      }
    });
  }
}
