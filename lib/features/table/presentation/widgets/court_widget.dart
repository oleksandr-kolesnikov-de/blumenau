/* ********************************************************************************************* */
/*                                   Oleksandr Kolesnikov                                        */
/*                                          © 2024                                               */
/* ********************************************************************************************* */

import 'package:blumenau/core/gestures/page_view_gesture_wrapper.dart';
import 'package:blumenau/core/style/blumenau_dimension.dart';
import 'package:blumenau/core/style/blumenau_icon.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/core/utils/utils.dart';
import 'package:blumenau/features/table/domain/entities/court.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:blumenau/features/table/presentation/widgets/dialog/piccode_dialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

// [CourtWidget] is a widget that displays a [SfCalendar] widget.
// It uses the [Court] and [Schedule] to get the data and display it.

class CourtWidget extends StatelessWidget {
  final Court court;
  final Schedule schedule;
  final PageController? pageController;
  final int? pageIndex;
  const CourtWidget({
    super.key,
    required this.court,
    required this.schedule,
    this.pageController,
    this.pageIndex,
  });

  @override
  Widget build(BuildContext context) {
    return PageViewGestureWrapper(
      pageController: pageController ?? PageController(),
      child: Column(
        children: [
          Padding(
            padding:
                const EdgeInsets.only(bottom: BlumenauPadding.normalPadding),
            child: Text(court.name, style: BlumenauTextStyle.headline),
          ),
          Container(
            height: BlumenauDimension.courtWidgetHeight(context),
            width: BlumenauDimension.courtWidgetWidth(context),
            color: Colors.white,
            child: SfCalendar(
              dataSource: schedule,
              selectionDecoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(color: Colors.transparent, width: 2),
              ),
              headerHeight: BlumenauPadding.zeroPadding,
              viewHeaderHeight: BlumenauPadding.zeroPadding,
              view: CalendarView.day,
              firstDayOfWeek: DateTime.now().weekday,
              appointmentBuilder:
                  (BuildContext context, CalendarAppointmentDetails details) {
                final Appointment appointment = details.appointments.first;
                return Container(
                    color: (appointment.startTime
                            .isBefore(Utils.getCurrentHourStartTime()))
                        ? Colors.grey.shade300
                        : Colors.white,
                    child: Stack(
                      children: [
                        Positioned(
                          top: BlumenauPadding.verySmallPadding,
                          left: BlumenauPadding.verySmallPadding,
                          child: Text(
                            appointment.subject,
                            style: BlumenauTextStyle.courtHeaderStyle,
                          ),
                        ),
                        if (!appointment.startTime
                            .isBefore(Utils.getCurrentHourStartTime()))
                          Positioned(
                            bottom: 0,
                            right: 0,
                            child: IconButton(
                              iconSize: BlumenauIcon.smallIconSize,
                              icon: const Icon(
                                Icons.close_sharp,
                              ),
                              onPressed: () async {
                                await showPinCodeDialog(
                                        context, PinCodeDialogType.deleteEntry)
                                    .then((result) {
                                  if (result is String) {
                                    context
                                        .read<TableBloc>()
                                        .add(DeleteEntryTableEvent(
                                          courtKey: court.key,
                                          pinCode: result,
                                          startTime: appointment.startTime,
                                          name: appointment.subject,
                                          appointments: schedule.appointments
                                              as List<Appointment>,
                                          keys: schedule.keys,
                                          preferredPage: pageIndex ?? 0,
                                        ));
                                  }
                                });
                              },
                            ),
                          ),
                      ],
                    ));
              },
              onTap: (CalendarTapDetails details) async {
                if ((details.date ?? DateTime.now())
                    .isBefore(Utils.getCurrentHourStartTime())) {
                  return;
                }
                await showPinCodeDialog(context, PinCodeDialogType.addEntry)
                    .then((result) async {
                  if (result is String) {
                    context.read<TableBloc>().add(AddEntryTableEvent(
                          courtKey: court.key,
                          pinCode: result,
                          startTime: details.date ?? DateTime.now(),
                          endTime: Utils.getTimePlusHour(details),
                          preferredPage: pageIndex ?? 0,
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
    );
  }
}
