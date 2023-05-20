import 'package:flutter/material.dart';

class Degerlendirme extends StatefulWidget {
  const Degerlendirme({super.key});

  @override
  State<Degerlendirme> createState() => _DegerlendirmeState();
}

class _DegerlendirmeState extends State<Degerlendirme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        backgroundColor: const Color.fromARGB(
          255,
          71,
          71,
          71,
        ),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 206, 205),
    );
  }
}
