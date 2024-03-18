import 'package:blumenau/core/literals/literals.dart';
import 'package:blumenau/core/style/blumenau_padding.dart';
import 'package:blumenau/core/style/blumenau_text_style.dart';
import 'package:blumenau/features/table/domain/entities/schedule.dart';
import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class CourtWidget extends StatelessWidget {
  const CourtWidget({
    super.key,
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
              child: Text(Literals.platz, style: BlumenauTextStyle.headline),
            ),
            Expanded(
              child: SfCalendar(
                headerHeight: BlumenauPadding.zeroPadding,
                viewHeaderHeight: BlumenauPadding.zeroPadding,
                view: CalendarView.day,
                firstDayOfWeek: DateTime.now().weekday,
                dataSource: Schedule([]),
                onTap: (CalendarTapDetails details) {},
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
  }
}
