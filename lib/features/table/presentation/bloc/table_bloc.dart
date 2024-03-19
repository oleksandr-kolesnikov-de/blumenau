/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/usecases/add_entry.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'table_event.dart';
part 'table_state.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  LoadSchedule loadSchedule;
  AddEntry addEntry;

  TableBloc(this.loadSchedule, this.addEntry)
      : super(TableInitialState(Schedule([]))) {
    on<LoadScheduleTableEvent>((event, emit) async {
      var eitherResult1 = await loadSchedule(NoParams());
      eitherResult1.fold((left) {}, (right) {
        emit(TableLoadedState(right));
      });
    });

    on<AddEntryTableEvent>((event, emit) async {
      var eitherResult1 = await addEntry(AddEntryParams(
          pinCode: event.pinCode,
          startTime: event.startTime,
          endTime: event.endTime));
      await eitherResult1.fold((left) async {}, (right) async {
        var eitherResult2 = await loadSchedule(NoParams());
        eitherResult2.fold((left) {}, (right) {
          emit(TableLoadedState(right));
        });
      });
    });
  }
}
