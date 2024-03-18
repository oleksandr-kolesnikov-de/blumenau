/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';

class TablePage extends StatefulWidget {
  const TablePage({super.key});

  @override
  State<TablePage> createState() => _TablePageState();
}

class _TablePageState extends State<TablePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: const Row(
        children: [
          Expanded(
            child: CourtWidget(),
          ),
          Expanded(
            child: CourtWidget(),
          ),
          Expanded(
            child: CourtWidget(),
          ),
          Expanded(
            child: CourtWidget(),
          ),
          Expanded(
            child: CourtWidget(),
          ),
          Expanded(
            child: CourtWidget(),
          ),
        ],
      ),
    );
  }
}
