/* ********************************************************************************************* */
/*                                    Oleksandr Kolesnikov                                       */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/injection/core_container.dart';
import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/pages/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// The main function of the application.
// It initializes the Flutter framework and the service locator.
// It runs the application.

void main() async {
  // Ensure that the Flutter framework is initialized
  WidgetsFlutterBinding.ensureInitialized();
  // Initializing the service locator to manage dependencies
  await configureCore();

  runApp(const BlumenauApp());
}

// The main application widget.
// It is a stateful widget that initializes the BLoC provider
// and the main page of the application.

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
                core<TableBloc>()..add(LoadTableEvent())),
      ],
      child: MaterialApp(
        title: Literals.appName,
        debugShowCheckedModeBanner: false,
        home: const TablePage(),
      ),
    );
  }
}
