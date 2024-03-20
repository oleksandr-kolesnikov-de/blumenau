/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// [TablePage] is a widget that displays a list of [CourtWidget] widgets.
// It uses the [TableBloc] to get the data and display it.

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(builder: (context, state) {
      if (state is TableInitialState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TableErrorState) {
        return Center(
          child: Text(Literals.error),
        );
      } else if (state is TableLoadingState) {
        return const Center(
          child: CircularProgressIndicator(),
        );
      } else if (state is TableLoadedState) {
        return Container(
          color: Colors.white,
          child: PageView(
            children: [
              Row(
                children: [
                  for (int i = 0; i < state.courts.length; i++)
                    CourtWidget(
                      court: state.courts[i],
                      schedule: state.schedule[i],
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
