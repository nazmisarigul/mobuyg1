import 'package:flutter/material.dart';
import 'package:mobuyg1/sayfalar/ana_sayfa.dart';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20.0),
            ElevatedButton(
              child: const Text('Basics'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnaSayfa()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Range Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnaSayfa()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Events'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnaSayfa()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Multiple Selection'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnaSayfa()),
              ),
            ),
            const SizedBox(height: 12.0),
            ElevatedButton(
              child: const Text('Complex'),
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (_) => const AnaSayfa()),
              ),
            ),
            const SizedBox(height: 20.0),
          ],
        ),
      ),
    );
  }
}
