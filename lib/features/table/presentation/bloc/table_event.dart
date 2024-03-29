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

class LoadScheduleTableEvent extends TableEvent {
  final int? preferredPage;
  const LoadScheduleTableEvent(this.preferredPage);
}

class AddEntryTableEvent extends TableEvent {
  final String courtKey;
  final String pinCode;
  final DateTime startTime;
  final DateTime endTime;
  final int preferredPage;

  const AddEntryTableEvent(
      {required this.courtKey,
      required this.pinCode,
      required this.startTime,
      required this.endTime,
      required this.preferredPage});
  @override
  List<Object> get props =>
      [pinCode, startTime, endTime, courtKey, preferredPage];
}

class DeleteEntryTableEvent extends TableEvent {
  final String courtKey;
  final String pinCode;
  final List<Appointment> appointments;
  final List<String> keys;
  final DateTime startTime;
  final String name;
  final int preferredPage;

  const DeleteEntryTableEvent(
      {required this.courtKey,
      required this.pinCode,
      required this.appointments,
      required this.keys,
      required this.startTime,
      required this.name,
      required this.preferredPage});
  @override
  List<Object> get props =>
      [pinCode, courtKey, appointments, keys, startTime, name, preferredPage];
}

class TryPinCodeTableEvent extends TableEvent {
  final String pinCode;

  const TryPinCodeTableEvent({required this.pinCode});
  @override
  List<Object> get props => [pinCode];
}

class ResetPinCodeTableEvent extends TableEvent {}
