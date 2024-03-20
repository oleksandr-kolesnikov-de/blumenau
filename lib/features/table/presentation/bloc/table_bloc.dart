/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/usecases/add_entry.dart';
import 'package:blumenau/features/table/domain/usecases/load_courts.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'table_event.dart';

class TableBloc extends Bloc<TableEvent, TableState> {
  LoadSchedule loadSchedule;
  LoadCourts loadCourts;
  AddEntry addEntry;

  TableBloc(this.loadSchedule, this.loadCourts, this.addEntry)
      : super(TableInitialState()) {
    on<LoadTableEvent>((event, emit) async {
      emit(state.loading());
      List<Court> courts = [];
      List<Schedule> schedule = [];
      bool error = false;
      if (error == false) {
        var eitherResult1 = await loadCourts(NoParams());
        eitherResult1.fold((left) {
          error = true;
        }, (right) {
          courts = right;
        });
      }
      if (error == false) {
        for (int i = 0; i < courts.length; i++) {
          var eitherResult2 =
              await loadSchedule(LoadScheduleParams(courts[i].key));
          eitherResult2.fold((left) {
            error = true;
          }, (right) {
            schedule.add(right);
          });
        }
      }
      emit(error
          ? state.error()
          : state.loaded().copyWith(courts: courts, schedule: schedule));
    });

    on<LoadCourtsTableEvent>((event, emit) async {
      var eitherResult = await loadCourts(NoParams());
      eitherResult.fold((left) {}, (right) {
        emit(state.loaded().copyWith(courts: right));
      });
    });

    on<LoadScheduleTableEvent>((event, emit) async {
      List<Schedule> schedule = [];
      for (int i = 0; i < state.courts.length; i++) {
        var eitherResult =
            await loadSchedule(LoadScheduleParams(state.courts[i].key));
        await eitherResult.fold((left) async {}, (right) async {
          schedule.add(right);
        });
      }
      emit(state.loaded().copyWith(schedule: schedule));
    });

    on<AddEntryTableEvent>((event, emit) async {
      var eitherResult1 = await addEntry(AddEntryParams(
          courtKey: event.courtKey,
          pinCode: event.pinCode,
          startTime: event.startTime,
          endTime: event.endTime));
      eitherResult1.fold((left) {}, (right) {
        add(LoadScheduleTableEvent());
      });
    });
  }
}
