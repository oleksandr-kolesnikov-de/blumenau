/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';

class TablePage extends StatelessWidget {
  const TablePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: PageView(
        children: const [
          Row(
            children: [
              CourtWidget(),
              CourtWidget(),
              CourtWidget(),
              CourtWidget(),
            ],
          ),
        ],
      ),
    );
  }
}
