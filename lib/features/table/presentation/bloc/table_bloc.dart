/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'dart:async';

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/style/blumenau_duration.dart';
import 'package:blumenau/core/use_case/no_params.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/usecases/add_entry.dart';
import 'package:blumenau/features/table/domain/usecases/delete_entry.dart';
import 'package:blumenau/features/table/domain/usecases/helpers/get_key_for_appointment.dart';
import 'package:blumenau/features/table/domain/usecases/load_courts.dart';
import 'package:blumenau/features/table/domain/usecases/load_schedule.dart';
import 'package:blumenau/features/table/domain/usecases/try_pin.dart';
import 'package:blumenau/features/table/presentation/bloc/table_state.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:weather/weather.dart';
part 'table_event.dart';

// [TableBloc] is a BLoC that manages the state of the table screen.
// It uses the [LoadSchedule], [LoadCourts], [AddEntry] use cases to get the data.

class TableBloc extends Bloc<TableEvent, TableState> {
  // Use cases
  LoadSchedule loadSchedule;
  LoadCourts loadCourts;
  AddEntry addEntry;
  DeleteEntry deleteEntry;
  TryPin tryPin;
  // Helpers
  GetKeyForAppointment getKeyForAppointment;

  // Weather
  WeatherFactory weatherFactory;

  // Other variables
  late Timer timer;

  // Dispose the timer when the bloc is closed
  void dispose() {
    timer.cancel();
    super.close();
  }

  TableBloc(this.loadSchedule, this.loadCourts, this.addEntry, this.deleteEntry,
      this.tryPin, this.getKeyForAppointment, this.weatherFactory)
      : super(TableInitialState()) {
    // Start update the table every 30 seconds
    timer = Timer.periodic(BlumenauDuration.updateDuration, (Timer t) {
      add(LoadTableEvent());
    });

    on<LoadTableEvent>((event, emit) async {
      if (state is! TableLoadingState) {
        await Future.delayed(BlumenauDuration.normalDuration);
        List<Court> courts = [];
        List<Schedule> schedule = [];
        bool error = false;
        if (error == false) {
          var courtsEither = await loadCourts(NoParams());
          courtsEither.fold((left) {
            error = true;
          }, (right) {
            courts = right;
          });
        }
        if (error == false) {
          for (int i = 0; i < courts.length; i++) {
            var scheduleEither =
                await loadSchedule(LoadScheduleParams(courts[i].key));
            scheduleEither.fold((left) {
              error = true;
              i = courts.length;
            }, (right) {
              schedule.add(right);
            });
          }
        }
        Weather w = await weatherFactory.currentWeatherByCityName("Hamburg");
        emit(error
            ? state.error()
            : state.loaded().copyWith(
                  courts: courts,
                  schedule: schedule,
                  temperature: w.temperature?.celsius?.toStringAsFixed(2) ??
                      "Not available",
                  conditions: w.weatherDescription ?? "Not available",
                ));
      }
    });

    on<LoadCourtsTableEvent>((event, emit) async {
      var eitherResult = await loadCourts(NoParams());
      eitherResult.fold((left) {
        emit(state.error());
      }, (right) {
        emit(state.loaded().copyWith(courts: right));
      });
    });

    on<LoadScheduleTableEvent>((event, emit) async {
      List<Schedule> schedule = [];
      bool error = false;
      for (int i = 0; i < state.courts.length; i++) {
        var eitherResult =
            await loadSchedule(LoadScheduleParams(state.courts[i].key));
        await eitherResult.fold((left) async {
          emit(state.error());
          i = state.courts.length;
          error = true;
        }, (right) async {
          schedule.add(right);
        });
      }
      emit(error
          ? state.error()
          : state.loaded().copyWith(
              schedule: schedule,
              preferredPageIndex: event.preferredPage ?? 0));
    });

    on<AddEntryTableEvent>((event, emit) async {
      emit(state.loading());
      var eitherResult = await addEntry(AddEntryParams(
          courtKey: event.courtKey,
          pinCode: event.pinCode,
          startTime: event.startTime,
          endTime: event.endTime));
      await eitherResult.fold((left) async {
        emit(state.error());
      }, (right) async {
        add(LoadScheduleTableEvent(event.preferredPage));
      });
    });

    on<DeleteEntryTableEvent>((event, emit) async {
      emit(state.loading());
      // Get the keys of all appointments
      List<String> keys = getKeyForAppointment(GetKeyForAppointmentParams(
        time: event.startTime,
        name: event.name,
        appointments: event.appointments,
        keys: event.keys,
      ));
      // Delete all appointments with the keys
      List<Either<Failure, void>> eitherResults = [];
      for (int i = 0; i < keys.length; i++) {
        var eitherResult = await deleteEntry(DeleteEntryParams(
            courtKey: event.courtKey, pinCode: event.pinCode, key: keys[i]));
        eitherResults.add(eitherResult);
      }
      keys.clear();
      // Check if there was an error
      bool isError = false;
      for (int i = 0; i < eitherResults.length; i++) {
        await eitherResults[i].fold((left) async {
          isError = true;
          i = eitherResults.length;
        }, (right) async {});
      }
      eitherResults.clear();
      // Emit the state
      if (isError) {
        emit(state.error());
      } else {
        add(LoadScheduleTableEvent(event.preferredPage));
      }
    });

    // Try to verify the pin code
    // If the pin code is less than 4 digits, reset the pin code table
    on<TryPinCodeTableEvent>((event, emit) async {
      if (event.pinCode.length < 4) {
        add(ResetPinCodeTableEvent());
      } else {
        var eitherResult = await tryPin(TryPinParams(pin: event.pinCode));
        eitherResult.fold((left) {
          emit(state.error());
        }, (right) {
          emit(state.loaded().copyWith(pinVerified: right));
        });
      }
    });

    on<ResetPinCodeTableEvent>((event, emit) async {
      emit(state.loaded().copyWith(pinVerified: false));
    });
  }
}
