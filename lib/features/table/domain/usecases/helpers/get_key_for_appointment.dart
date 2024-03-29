/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/use_case/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [GetKeyForAppointment] is a helper function that returns the key of the appointment.

class GetKeyForAppointment extends Helper<String, GetKeyForAppointmentParams> {
  GetKeyForAppointment();

  @override
  String call(GetKeyForAppointmentParams params) {
    for (int i = 0; i < params.keys.length; i++) {
      if ((params.appointments[i].startTime == params.time) &&
          (params.appointments[i].subject == params.name)) {
        return params.keys[i];
      }
    }
    return "";
  }
}

class GetKeyForAppointmentParams extends Equatable {
  final DateTime time;
  final String name;
  final List<Appointment> appointments;
  final List<String> keys;
  const GetKeyForAppointmentParams({
    required this.time,
    required this.name,
    required this.appointments,
    required this.keys,
  });
  @override
  List<Object> get props => [time, name, appointments, keys];
}
