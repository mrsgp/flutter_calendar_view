import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import '../pages/event_details_page.dart';

class WeekViewWidget extends StatelessWidget {
  final GlobalKey<WeekViewState>? state;
  final double? width;

  const WeekViewWidget({super.key, this.state, this.width});

  @override
  Widget build(BuildContext context) {
    return WeekView(
      key: state,
      width: width,
      onEventTap: (events, date) {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (_) => DetailsPage(
              event: events.first,
            ),
          ),
        );
      },
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
