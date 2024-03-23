/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:bloc_test/bloc_test.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:blumenau/features/table/presentation/pages/table_page.dart';
import 'package:blumenau/features/table/presentation/widgets/court_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

// [TablePage] test
// Checks wether rendered correct number of courts

class MockTableBloc extends MockBloc<TableEvent, TableState>
    implements TableBloc {}

class TableStateFake extends Fake implements TableState {}

class TableEventFake extends Fake implements TableEvent {}

void main() {
  setUpAll(() {
    registerFallbackValue(TableStateFake());
    registerFallbackValue(TableEventFake());
  });

  testWidgets('Checks wether rendered correct number of courts',
      (WidgetTester tester) async {
    // arrange

    var mockTableBloc = MockTableBloc();

    when(() => mockTableBloc.state).thenReturn(TableLoadedState(courts: [
      const Court(name: '1', key: '1'),
      const Court(name: '1', key: '1'),
    ], schedule: [
      Schedule([], []),
      Schedule([], [])
    ]));

    final page = MediaQuery(
      data: const MediaQueryData(
        size: Size(1280, 800),
      ),
      child: MultiBlocProvider(
        providers: [
          BlocProvider<TableBloc>(
            lazy: false,
            create: (context) => mockTableBloc,
          ),
        ],
        child: const MaterialApp(
          home: TablePage(),
        ),
      ),
    );
    await tester.pumpWidget(page);
    await tester.pumpAndSettle();

    // test

    var result = find.byType(CourtWidget);

    // verify

    expect(result, findsNWidgets(mockTableBloc.state.courts.length));
  });
}
