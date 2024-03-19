/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

part of 'table_bloc.dart';

abstract class TableState extends Equatable {
  final Schedule schedule;
  const TableState(this.schedule);

  @override
  List<Object> get props => [];
}

class TableInitialState extends TableState {
  @override
  final Schedule schedule;
  const TableInitialState(this.schedule) : super(schedule);

  @override
  List<Object> get props => [schedule];
}

class TableLoadingState extends TableState {
  @override
  final Schedule schedule;
  const TableLoadingState(this.schedule) : super(schedule);

  @override
  List<Object> get props => [schedule];
}

class TableErrorState extends TableState {
  @override
  final Schedule schedule;
  const TableErrorState(this.schedule) : super(schedule);

  @override
  List<Object> get props => [schedule];
}

class TableLoadedState extends TableState {
  @override
  final Schedule schedule;
  const TableLoadedState(this.schedule) : super(schedule);

  @override
  List<Object> get props => [schedule];
}
