import 'package:flutter/material.dart';

class Etkinlikler extends StatefulWidget {
  const Etkinlikler({super.key});

  @override
  State<Etkinlikler> createState() => _EtkinliklerState();
}

class _EtkinliklerState extends State<Etkinlikler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 206, 205),
      body: Column(
        children: [
          TextButton(
            onPressed: () {},
            child: const Text("1.Hafta Etkinlikler"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("2.Hafta Etkinlikler"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("3.Hafta Etkinlikler"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("4.Hafta Etkinlikler"),
          ),
          TextButton(
            onPressed: () {},
            child: const Text("5.Hafta Etkinlikler"),
          )
        ],
      ),
    );
  }
}
