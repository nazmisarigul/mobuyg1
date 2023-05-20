import 'package:flutter/material.dart';

class Notlar extends StatefulWidget {
  const Notlar({super.key});

  @override
  State<Notlar> createState() => _NotlarState();
}

class _NotlarState extends State<Notlar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 206, 205),
    );
  }
}
