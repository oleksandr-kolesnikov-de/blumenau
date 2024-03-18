/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  LoadSchedule loadSchedule;

  TableBloc(this.loadSchedule) : super(TableInitialState()) {
    on<LoadScheduleTableEvent>((event, emit) async {
      var eitherResult = await loadSchedule(NoParams());
      eitherResult.fold((left) {}, (right) {});
    });
  }
}
