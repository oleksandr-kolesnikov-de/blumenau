import 'package:equatable/equatable.dart';

import 'package:flutter_bloc/flutter_bloc.dart';


part 'table_event.dart';

part 'table_state.dart';


class TableBloc extends Bloc<TableEvent, TableState> {

  TableBloc() : super(TableInitial()) {

    on<TableEvent>((event, emit) {});

  }

}

