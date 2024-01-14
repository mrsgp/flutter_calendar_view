import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';
import 'mdc_calandar_cell_widget.dart';

class MonthViewWidget extends StatelessWidget {
  final GlobalKey<MonthViewState>? state;
  final double? width;

  const MonthViewWidget({
    super.key,
    this.state,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return MonthView(
      key: state,
      width: width,
      onEventTap: (event, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: event,
            ),
          ),
        );
      },
      minMonth: DateTime.now(),
      cellBuilder: (date, event, isToday, isInMonth) {
        return MDCFilledCell(
          date: date,
          events: event,
          isInMonth: isInMonth,
          shouldHighlight: isToday,
          backgroundColor:
              _isBeforeDate(date) ? Colors.grey : _cellBackgroundColor(event),
        );
      },
      onCellTap: (events, date) {
        if (_isBeforeDate(date)) return;
        print(events);
        print(date);
      },
      headerStringBuilder: (date, {secondaryDate}) {
        return _dateString(date);
      },
    );
  }

  bool _isBeforeDate(DateTime date) {
    return date.isBefore(DateTime.now().withoutTime);
  }

  String _dateString(DateTime date) {
    var monthName = "";
    if (date.month == 1)
      monthName = "Jan";
    else if (date.month == 2)
      monthName = "Feb";
    else if (date.month == 3)
      monthName = "Mar";
    else if (date.month == 4)
      monthName = "Apr";
    else if (date.month == 5)
      monthName = "May";
    else if (date.month == 6)
      monthName = "Jun";
    else if (date.month == 7)
      monthName = "Jul";
    else if (date.month == 8)
      monthName = "Aug";
    else if (date.month == 9)
      monthName = "Sep";
    else if (date.month == 10)
      monthName = "Oct";
    else if (date.month == 11)
      monthName = "Nov";
    else if (date.month == 12) monthName = "Dec";

    return "${monthName} ${date.year}";
  }

  Color _cellBackgroundColor(List<CalendarEventData> events) {
    if (events.isEmpty)
      return Colors.white;
    else if (events.length < 12)
      return Colors.white10;
    else if (events.length >= 12 && events.length < 24)
      return Colors.white30;
    else
      return Colors.grey;
  }
}
