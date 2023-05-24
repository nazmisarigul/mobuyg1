import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobuyg1/widgetler/pdf_goster.dart';
import 'package:path_provider/path_provider.dart';

class Etkinlikler extends StatefulWidget {
  const Etkinlikler({super.key});

  @override
  State<Etkinlikler> createState() => _EtkinliklerState();
}

class _EtkinliklerState extends State<Etkinlikler> {
  Future<File> fromAsset(String asset, String filename) async {
    // To open from assets, you can copy them to the app storage folder, and the access them "locally"
    Completer<File> completer = Completer();

    try {
      var dir = await getApplicationDocumentsDirectory();
      File file = File("${dir.path}/$filename");
      var data = await rootBundle.load(asset);
      var bytes = data.buffer.asUint8List();
      await file.writeAsBytes(bytes, flush: true);
      completer.complete(file);
    } catch (e) {
      throw Exception('Error parsing asset file!');
    }

    return completer.future;
  }

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
            onPressed: () {
              fromAsset('assets/pdf/1.pdf', '1.pdf').then((file) {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => PdfGoster(
                      path: file.path,
                      baslik: "1.Hafta Etkinlikler",
                    ),
                  ),
                );
              });
            },
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
