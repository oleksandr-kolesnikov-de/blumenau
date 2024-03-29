/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/features/table/domain/usecases/helpers/get_key_for_appointment.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart'; // Assuming your class file is named get_key_for_appointment.dart

// [GetKeyForAppointment] test
// Checks wether the key of the appointment is returned correctly
// If the appointment is not found, it should return an empty string
void main() {
  group('GetKeyForAppointment', () {
    test('returns correct key for appointment', () {
      final getKeyForAppointment = GetKeyForAppointment();

      // Define sample data
      final appointments = [
        Appointment(
          startTime: DateTime(2024, 3, 23, 8, 0),
          endTime: DateTime(2024, 3, 23, 9, 0),
          subject: 'Andy Roddick',
        ),
        Appointment(
          startTime: DateTime(2024, 3, 23, 9, 0),
          endTime: DateTime(2024, 3, 23, 10, 0),
        ),
      ];

      final keys = ['key1', 'key2'];
      final timeToFind = DateTime(2024, 3, 23, 8, 0);
      const nameToFind = 'Andy Roddick';

      // Define parameters
      final params = GetKeyForAppointmentParams(
        time: timeToFind,
        name: nameToFind,
        appointments: appointments,
        keys: keys,
      );

      // Call the method
      final result = getKeyForAppointment(params);

      // Check the result
      expect(result, 'key1');
    });

    test('returns empty string if appointment not found', () {
      final getKeyForAppointment = GetKeyForAppointment();

      // Define sample data
      final appointments = [
        Appointment(
          startTime: DateTime(2024, 3, 23, 8, 0),
          endTime: DateTime(2024, 3, 23, 9, 0),
        ),
      ];

      final keys = ['key1'];
      final timeToFind = DateTime(2024, 3, 23, 9, 0);
      const nameToFind = 'Andy Roddick';

      // Define parameters
      final params = GetKeyForAppointmentParams(
        time: timeToFind,
        name: nameToFind,
        appointments: appointments,
        keys: keys,
      );

      // Call the method
      final result = getKeyForAppointment(params);

      // Check the result
      expect(result, '');
    });
  });
}
