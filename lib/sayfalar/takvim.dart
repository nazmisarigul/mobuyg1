import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';

class Takvim extends StatefulWidget {
  const Takvim({super.key});

  @override
  State<Takvim> createState() => _TakvimState();
}

class _TakvimState extends State<Takvim> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TableCalendar Example'),
      ),
      body: Center(
        child: TableCalendar(
          locale: 'tr_TR',
          firstDay: DateTime.now(),
          lastDay: DateTime.utc(2030, 3, 14),
          focusedDay: DateTime.now(),
        ),
      ),
    );
  }
}
