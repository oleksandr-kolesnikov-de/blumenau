/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// [TableState] is a class that contains the state of the [TableBloc].
// Possible states are: [TableInitialState], [TableLoadingState], [TableLoadedState], [TableErrorState].
// Fields are: [courts], [schedule].

part 'table_state.freezed.dart';

@freezed
class TableState with _$TableState {
  const TableState._();

  factory TableState(
      {@Default([]) List<Court> courts,
      @Default([]) List<Schedule> schedule}) = _TableState;

  factory TableState.initial(
      {@Default([]) List<Court> courts,
      @Default([]) List<Schedule> schedule}) = TableInitialState;

  TableState initial() {
    return TableState.initial(
      courts: courts,
      schedule: schedule,
    );
  }

  factory TableState.loading(
      {@Default([]) List<Court> courts,
      @Default([]) List<Schedule> schedule}) = TableLoadingState;

  TableState loading() {
    return TableState.loading(
      courts: courts,
      schedule: schedule,
    );
  }

  factory TableState.loaded(
      {@Default([]) List<Court> courts,
      @Default([]) List<Schedule> schedule}) = TableLoadedState;

  TableState loaded() {
    return TableState.loaded(
      courts: courts,
      schedule: schedule,
    );
  }

  factory TableState.error(
      {@Default([]) List<Court> courts,
      @Default([]) List<Schedule> schedule}) = TableErrorState;

  TableState error() {
    return TableState.error(
      courts: courts,
      schedule: schedule,
    );
  }
}
