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

class LoadTableEvent extends TableEvent {}

class LoadCourtsTableEvent extends TableEvent {}

class LoadScheduleTableEvent extends TableEvent {}

class AddEntryTableEvent extends TableEvent {
  final String courtKey;
  final String pinCode;
  final DateTime startTime;
  final DateTime endTime;

  const AddEntryTableEvent(
      {required this.courtKey,
      required this.pinCode,
      required this.startTime,
      required this.endTime});
  @override
  List<Object> get props => [pinCode, startTime, endTime];
}
