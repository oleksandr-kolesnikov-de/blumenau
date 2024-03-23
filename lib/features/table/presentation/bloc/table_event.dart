/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

// [TableEvent] is a class that contains the events of the [TableBloc].
// Possible events are: [LoadTableEvent], [LoadCourtsTableEvent],
// [LoadScheduleTableEvent], [AddEntryTableEvent].

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

class DeleteEntryTableEvent extends TableEvent {
  final String courtKey;
  final String pinCode;
  final List<Appointment> appointments;
  final List<String> keys;
  final DateTime startTime;

  const DeleteEntryTableEvent(
      {required this.courtKey,
      required this.pinCode,
      required this.appointments,
      required this.keys,
      required this.startTime});
  @override
  List<Object> get props => [pinCode, courtKey, appointments, keys, startTime];
}

class TryPinCodeTableEvent extends TableEvent {
  final String pinCode;

  const TryPinCodeTableEvent({required this.pinCode});
  @override
  List<Object> get props => [pinCode];
}

class ResetPinCodeTableEvent extends TableEvent {}
