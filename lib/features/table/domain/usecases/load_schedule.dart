/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/error/failure.dart';
import 'package:blumenau/core/use_case/use_case.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/domain/repositories/table_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [LoadSchedule] is a use case that loads the schedule for a given court.
// It uses the [TableRepository] to get the data.
// It returns a [Schedule] object or a [Failure].

class LoadSchedule implements UseCase<Schedule, LoadScheduleParams> {
  final TableRepository repository;

  LoadSchedule(this.repository);

  @override
  Future<Either<Failure, Schedule>> call(LoadScheduleParams params) async {
    final result = await repository.loadSchedule(params.courtKey);
    return result.fold(
      (failure) => Left(failure),
      (scheduleItems) {
        final List<Appointment> appointments = [];
        final List<String> keys = [];
        for (final scheduleItem in scheduleItems) {
          appointments.add(
            Appointment(
              startTime: scheduleItem.startTime,
              endTime: scheduleItem.endTime,
              subject: scheduleItem.title,
            ),
          );
          keys.add(scheduleItem.key);
        }
        return Right(Schedule(appointments, keys));
      },
    );
  }
}

class LoadScheduleParams {
  final String courtKey;

  LoadScheduleParams(this.courtKey);
}
