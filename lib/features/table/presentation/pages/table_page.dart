/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

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
        return const Center(
          child: Text('Error'),
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
                  CourtWidget(
                    court: state.courts[0],
                    schedule: state.schedule[0],
                  ),
                  CourtWidget(
                    court: state.courts[1],
                    schedule: state.schedule[1],
                  ),
                  CourtWidget(
                    court: state.courts[2],
                    schedule: state.schedule[2],
                  ),
                  CourtWidget(
                    court: state.courts[3],
                    schedule: state.schedule[3],
                  ),
                ],
              ),
            ],
          ),
        );
      } else {
        return const Center(
          child: Text('Unknown state'),
        );
      }
    });
  }
}
