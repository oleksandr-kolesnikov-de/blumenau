/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'dart:io';

import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/widgets/error_screen_widget.dart';
import 'package:blumenau/core/widgets/loading_screen_widget.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        PageViewConfig.instance.itemsPerPage =
            (orientation == Orientation.landscape) ? 3 : 1;
        return BlocBuilder<TableBloc, TableState>(builder: (context, state) {
          if (state is TableInitialState) {
            return const SplashScreenWidget();
          } else if (state is TableErrorState) {
            return const ErrorScreenWidget();
          } else if (state is TableLoadingState) {
            return const LoadingScreenWidget();
          } else if (state is TableLoadedState) {
            return Container(
              color: Colors.white,
              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        top: BlumenauPadding.veryBigPadding),
                    child: PageView.builder(
                      controller: pageController,
                      itemCount: state.pageCount,
                      itemBuilder: (context, page) {
                        return Row(
                          children: List.generate(
                            state.endIndex(page) - state.startIndex(page),
                            (i) => CourtWidget(
                              court: state.courts[state.startIndex(page) + i],
                              schedule:
                                  state.schedule[state.startIndex(page) + i],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  if (Platform.isWindows ||
                      Platform.isLinux ||
                      Platform.isMacOS)
                    Padding(
                      padding: const EdgeInsets.only(
                          top: BlumenauPadding.veryBigPadding),
                      child: Row(
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
                    ),
                ],
              ),
            );
          } else {
            return const ErrorScreenWidget();
          }
        });
      });
    });
  }
}
