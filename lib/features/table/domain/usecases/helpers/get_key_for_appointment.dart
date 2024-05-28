/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/use_case/helper.dart';
import 'package:equatable/equatable.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [GetKeyForAppointment] is a helper function that returns
// the keys of the appointments that have the same time and name.

class GetKeyForAppointment
    extends Helper<List<String>, GetKeyForAppointmentParams> {
  GetKeyForAppointment();

  @override
  List<String> call(GetKeyForAppointmentParams params) {
    List<String> keys = [];
    for (int i = 0; i < params.keys.length; i++) {
      if ((params.appointments[i].startTime == params.time) &&
          (params.appointments[i].subject == params.name)) {
        keys.add(params.keys[i]);
      }
    }
    return keys;
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
