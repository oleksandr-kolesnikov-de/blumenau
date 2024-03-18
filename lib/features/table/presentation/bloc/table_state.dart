/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

part of 'table_bloc.dart';

abstract class TableState extends Equatable {
  const TableState();

  @override
  List<Object> get props => [];
}

class TableInitialState extends TableState {}

class TableLoadingState extends TableState {}

class TableErrorState extends TableState {}

class TableLoadedState extends TableState {
  final Schedule schedule;

  const TableLoadedState(this.schedule);
}
