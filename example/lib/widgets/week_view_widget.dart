import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../model/event.dart';

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<WeekViewState>? state;
  final double? width;

  const WeekViewWidget({Key? key, this.state, this.width}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WeekView<Event>(
      liveTimeIndicatorSettings: HourIndicatorSettings(height: 0),
      minuteSlotSize: MinuteSlotSize.minutes30,
      showLiveTimeLineInAllDays: false,
      onDateTap: (date) => print(date),
      timeLineBuilder: (date) => _timeLineBuilder(date),
      minDay: DateTime.now(),
      key: state,
      width: width,
      weekNumberBuilder: (firstDayOfWeek) => Text(''),
      headerStringBuilder: null,
      onPageChange: (date, page) {},
    );
  }
}

Widget _timeLineBuilder(DateTime date) {
  if (date.minute != 0) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        Positioned.fill(
          top: -8,
          right: 8,
          child: Text(
            "${date.hour}:${date.minute}",
            textAlign: TextAlign.right,
            style: TextStyle(
              color: Colors.black.withAlpha(50),
              fontStyle: FontStyle.italic,
              fontSize: 12,
            ),
          ),
        ),
      ],
    );
  }

  final hour = ((date.hour - 1) % 12) + 1;
  return Stack(
    clipBehavior: Clip.none,
    children: [
      Positioned.fill(
        top: -8,
        right: 8,
        child: Text(
          "$hour ${date.hour ~/ 12 == 0 ? "am" : "pm"}",
          textAlign: TextAlign.right,
        ),
      ),
    ],
  );
}
