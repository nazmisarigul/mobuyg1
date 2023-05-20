import 'dart:developer';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobuyg1/modeller/kisi.dart';

class Iletisim extends StatefulWidget {
  const Iletisim({super.key});

  @override
  State<Iletisim> createState() => _IletisimState();
}

class _IletisimState extends State<Iletisim> {
  final _adi = TextEditingController();
  final _soyadi = TextEditingController();
  final _mesaj = TextEditingController();

  final CollectionReference _colref =
      FirebaseFirestore.instance.collection("Kisi");
  Future<void> gonder() async {
    Kisi k = Kisi(adi: _adi.text, soyadi: _soyadi.text, mesaj: _mesaj.text);
    _colref.add({k.toJson()}).then((value) =>
        Fluttertoast.showToast(msg: "kayıt eklendi").catchError((error) {
          log(error.toString());
          return error;
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Ana Sayfa"),
          backgroundColor: const Color.fromARGB(255, 71, 71, 71),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Image.asset("assets/images/2.png"),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextFormField(
                        controller: _adi,
                        decoration: const InputDecoration(
                            hintText: "adi",
                            prefix: Icon(Icons.person),
                            labelText: "İsminiz",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextFormField(
                        controller: _soyadi,
                        decoration: const InputDecoration(
                            hintText: "Soyadi",
                            prefix: Icon(Icons.person),
                            labelText: "Soy İsminiz",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    TextFormField(
                        controller: _mesaj,
                        decoration: const InputDecoration(
                            hintText: "Mesaj",
                            prefix: Icon(Icons.message),
                            labelText: "Mesajınız",
                            border: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue)))),
                    ElevatedButton(
                        onPressed: gonder, child: const Text("Gönder"))
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
