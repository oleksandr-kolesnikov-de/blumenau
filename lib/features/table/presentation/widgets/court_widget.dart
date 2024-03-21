/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/core/utils/utils.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/widgets/piccode_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [CourtWidget] is a widget that displays a [SfCalendar] widget.
// It uses the [Court] and [Schedule] to get the data and display it.

class CourtWidget extends StatelessWidget {
  final Court court;
  final Schedule schedule;
  const CourtWidget({
    super.key,
    required this.court,
    required this.schedule,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(BlumenauPadding.verySmallPadding),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(BlumenauPadding.smallPadding),
              child: Text(court.name, style: BlumenauTextStyle.headline),
            ),
            Expanded(
              child: SfCalendar(
                dataSource: schedule,
                headerHeight: BlumenauPadding.zeroPadding,
                viewHeaderHeight: BlumenauPadding.zeroPadding,
                view: CalendarView.day,
                firstDayOfWeek: DateTime.now().weekday,
                onTap: (CalendarTapDetails details) async {
                  showPinCodeDialog(context).then((result) {
                    if (result is String) {
                      context.read<TableBloc>().add(AddEntryTableEvent(
                            courtKey: court.key,
                            pinCode: result,
                            startTime: details.date ?? DateTime.now(),
                            endTime: Utils.getTimePlusHour(details),
                          ));
                    }
                  });
                },
                onLongPress: (calendarLongPressDetails) async {
                  showPinCodeDialog(context).then((result) {
                    if (result is String) {
                      context.read<TableBloc>().add(DeleteEntryTableEvent(
                            courtKey: court.key,
                            pinCode: result,
                            key: _getKey(
                                calendarLongPressDetails.date ?? DateTime.now(),
                                schedule.appointments as List<Appointment>,
                                schedule.keys),
                          ));
                    }
                  });
                },
                minDate: Utils.getTodaysMinTime(),
                maxDate: Utils.getTodaysMaxTime(),
                timeSlotViewSettings: Utils.getWorkingHours(),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String _getKey(
      DateTime time, List<Appointment> appointments, List<String> keys) {
    for (int i = 0; i < appointments.length; i++) {
      if (appointments[i].startTime == time) {
        return keys[i];
      }
    }
    return "";
  }
}
