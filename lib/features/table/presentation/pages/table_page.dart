/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/config/page_view_config.dart';
import 'package:blumenau/core/widgets/error_screen_widget.dart';
import 'package:blumenau/core/widgets/splash_screen_widget.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/widgets/body_widget.dart';
import 'package:blumenau/features/table/presentation/widgets/header_widget.dart';
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
  late PageController pageController;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        PageViewConfig.instance.itemsPerPage =
            (orientation == Orientation.landscape)
                ? PageViewConfig.instance.pagesLandscape
                : PageViewConfig.instance.pagesPortrait;
        return BlocBuilder<TableBloc, TableState>(builder: (context, state) {
          if (state is TableInitialState) {
            return const SplashScreenWidget();
          } else if (state is TableErrorState) {
            return const ErrorScreenWidget();
          } else if (state is TableLoadedState || state is TableLoadingState) {
            pageController =
                PageController(initialPage: state.preferredPageIndex);
            return Stack(
              children: [
                // Background
                Container(
                  color: Colors.white,
                ),
                // Header
                HeaderWidget(state: state),
                // Body with courts
                BodyWidget(state: state, pageController: pageController),
              ],
            );
          } else {
            return const ErrorScreenWidget();
          }
        });
      });
    });
  }
}
