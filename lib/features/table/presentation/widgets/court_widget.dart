import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/features/table/presentation/bloc/table_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtWidget extends StatelessWidget {
  const CourtWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<TableBloc, TableState>(builder: (context, state) {
      return Expanded(
        child: Padding(
          padding: const EdgeInsets.all(BlumenauPadding.verySmallPadding),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(BlumenauPadding.smallPadding),
                child: Text(Literals.platz, style: BlumenauTextStyle.headline),
              ),
              Expanded(
                child: SfCalendar(
                  dataSource: state.schedule,
                  headerHeight: BlumenauPadding.zeroPadding,
                  viewHeaderHeight: BlumenauPadding.zeroPadding,
                  view: CalendarView.day,
                  firstDayOfWeek: DateTime.now().weekday,
                  onTap: (CalendarTapDetails details) {
                    context.read<TableBloc>().add(AddEntryTableEvent(
                          pinCode: '1234',
                          startTime: details.date ?? DateTime.now(),
                          endTime: DateTime(
                              details.date?.year ?? 1990,
                              details.date?.month ?? 1,
                              details.date?.day ?? 1,
                              (details.date?.hour ?? 1) + 1,
                              details.date?.minute ?? 0,
                              0),
                        ));
                  },
                  minDate: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, DateTime.now().hour + 1, 0, 0),
                  maxDate: DateTime(DateTime.now().year, DateTime.now().month,
                      DateTime.now().day, 22, 0, 0),
                  timeSlotViewSettings: const TimeSlotViewSettings(
                      timeFormat: 'HH:mm',
                      startHour: 8,
                      endHour: 22,
                      nonWorkingDays: <int>[]),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
