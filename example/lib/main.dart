import 'dart:ui';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';

import 'model/event.dart';
import 'pages/mobile/mobile_home_page.dart';
import 'pages/web/web_home_page.dart';
import 'widgets/responsive_widget.dart';

DateTime get _now => DateTime.now();

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return CalendarControllerProvider<Event>(
      controller: EventController<Event>()..addAll(_events),
      child: MaterialApp(
        title: 'Flutter Calendar Page Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(),
        scrollBehavior: ScrollBehavior().copyWith(
          dragDevices: {
            PointerDeviceKind.trackpad,
            PointerDeviceKind.mouse,
            PointerDeviceKind.touch,
          },
        ),
        home: ResponsiveWidget(
          mobileWidget: MobileHomePage(),
          webWidget: WebHomePage(),
        ),
      ),
    );
  }
}

List<CalendarEventData<Event>> _events = [
  CalendarEventData(
    id: 1,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 18, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    id: 2,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 20, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    id: 3,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 20, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 22),
  ),
  CalendarEventData(
    id: 4,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 1, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 2, 30),
  ),
  CalendarEventData(
    id: 5,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 2, 31),
    endTime: DateTime(_now.year, _now.month, _now.day, 3, 30),
  ),
  CalendarEventData(
    id: 6,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 3, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 4, 30),
  ),
  CalendarEventData(
    id: 7,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 4, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 5, 30),
  ),
  CalendarEventData(
    id: 8,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 5, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 6, 30),
  ),
  CalendarEventData(
    id: 9,
    date: _now,
    event: Event(title: "Joe's Birthday"),
    title: "Project meeting",
    description: "Today is project meeting.",
    startTime: DateTime(_now.year, _now.month, _now.day, 6, 30),
    endTime: DateTime(_now.year, _now.month, _now.day, 7, 30),
  ),
  
];
