import 'package:syncfusion_flutter_calendar/calendar.dart';
import 'package:flutter/material.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  CalendarState createState() => CalendarState();
}

class CalendarState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SfCalendar(
      view: CalendarView.month,
    ));
  }
}
