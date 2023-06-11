import 'package:flutter/material.dart';
import 'package:mobuyg1/modeller/soru.dart';

class Sonuc extends StatefulWidget {
  final List<SorularCls> _listSorular;
  const Sonuc(this._listSorular, {super.key});

  @override
  _SonucState createState() => _SonucState();
}

class _SonucState extends State<Sonuc> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("sonuc"),
        ),
        body: Column(
            children: widget._listSorular
                .map((e) => Text("${e.soru} ${e.puan}"))
                .toList()));
  }
}
