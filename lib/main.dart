/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/injection/core_container.dart';
import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/features/table/data/models/schedule_item_hive_model.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/pages/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  // Ensure that the Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing the service locator to manage dependencies
  await configureCore();

  // Initialize Hive and register adapters
  var dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ScheduleItemHiveModelAdapter());

  runApp(const BlumenauApp());
}

class BlumenauApp extends StatefulWidget {
  const BlumenauApp({super.key});

  @override
  BlumenauAppState createState() => BlumenauAppState();
}

class BlumenauAppState extends State<BlumenauApp> {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<TableBloc>(
            create: (BuildContext context) =>
                core<TableBloc>()..add(LoadScheduleTableEvent())),
      ],
      child: MaterialApp(
        title: Literals.appName,
        debugShowCheckedModeBanner: false,
        home: const TablePage(),
      ),
    );
  }
}
