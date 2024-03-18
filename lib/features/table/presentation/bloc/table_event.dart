/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

part of 'table_bloc.dart';

abstract class TableEvent extends Equatable {
  const TableEvent();
  @override
  List<Object> get props => [];
}

class LoadScheduleTableEvent extends TableEvent {}
