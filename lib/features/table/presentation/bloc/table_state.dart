/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/config/page_view_config.dart';
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

  factory TableState({
    @Default([]) List<Court> courts,
    @Default([]) List<Schedule> schedule,
    @Default(false) bool pinVerified,
  }) = _TableState;

  factory TableState.initial({
    @Default([]) List<Court> courts,
    @Default([]) List<Schedule> schedule,
    @Default(false) bool pinVerified,
  }) = TableInitialState;

  TableState initial() {
    return TableState.initial(
      courts: courts,
      schedule: schedule,
      pinVerified: pinVerified,
    );
  }

  factory TableState.loading({
    @Default([]) List<Court> courts,
    @Default([]) List<Schedule> schedule,
    @Default(false) bool pinVerified,
  }) = TableLoadingState;

  TableState loading() {
    return TableState.loading(
      courts: courts,
      schedule: schedule,
      pinVerified: pinVerified,
    );
  }

  factory TableState.loaded({
    @Default([]) List<Court> courts,
    @Default([]) List<Schedule> schedule,
    @Default(false) bool pinVerified,
  }) = TableLoadedState;

  TableState loaded() {
    return TableState.loaded(
      courts: courts,
      schedule: schedule,
      pinVerified: pinVerified,
    );
  }

  factory TableState.error({
    @Default([]) List<Court> courts,
    @Default([]) List<Schedule> schedule,
    @Default(false) bool pinVerified,
  }) = TableErrorState;

  TableState error() {
    return TableState.error(
      courts: courts,
      schedule: schedule,
      pinVerified: pinVerified,
    );
  }

  // Preprocessing of PageView.builder parameters.
  int get pageCount =>
      (courts.length / PageViewConfig.instance.itemsPerPage).ceil();
  int startIndex(int pageIndex) =>
      pageIndex * PageViewConfig.instance.itemsPerPage;
  int endIndex(int pageIndex) =>
      (pageIndex * PageViewConfig.instance.itemsPerPage +
              PageViewConfig.instance.itemsPerPage)
          .clamp(0, courts.length);
}
