import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../modeller/soru.dart';
import 'sonuc.dart';

class Degerlendirme extends StatefulWidget {
  const Degerlendirme({super.key});

  @override
  State<Degerlendirme> createState() => _DegerlendirmeState();
}

class _DegerlendirmeState extends State<Degerlendirme> {
  final CollectionReference<Map<String, dynamic>> _colref =
      FirebaseFirestore.instance.collection("sorular");

  int soruno = 0;
  String _groupvalue = " ";

  final List<SorularCls> _listSorular = [];
  Future<bool> sorulariGetir() async {
    if (_listSorular.isNotEmpty) return Future(() => true);
    QuerySnapshot<Map<String, dynamic>> qs = await _colref.get();

    for (var element in qs.docs) {
      print(element.data().toString());
      _listSorular.add(SorularCls.fromJson(element.data()));
    }

    return true;
  }

  void cevapclick(value) {
    setState(() {
      _groupvalue = value;
      _listSorular[soruno].ocevap = _groupvalue;
    });
    kontrol();
  }

  void kontrol() {
    if (_groupvalue == _listSorular[soruno].dCevap) {
      _listSorular[soruno].puan = 4;

      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("çok güzel devam et"),
                content: Text(_listSorular[soruno].yDonut),
              ));
      print("başarılı");
    } else {
      _listSorular[soruno].puan = 0;
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: const Text("tekrar denemelisin"),
                content: Text(_listSorular[soruno].yDonut),
              ));
      print(_listSorular[soruno].yDonut);
    }
  }

  void sorudegis(int value) {
    if (value > 0 && soruno == _listSorular.length - 1) {
      return;
    }
    setState(() {
      soruno += value;

      _groupvalue = _listSorular[soruno].ocevap;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Değerlendirme"),
          backgroundColor: const Color.fromARGB(
            255,
            71,
            71,
            71,
          ),
        ),
        backgroundColor: const Color.fromARGB(255, 207, 206, 205),
        body: FutureBuilder<void>(
            future: sorulariGetir(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      Text("Soru  ${soruno + 1} ${_listSorular[soruno].soru}"),
                      RadioListTile(
                          title: Text(_listSorular[soruno].a),
                          value: "a",
                          groupValue: _groupvalue,
                          onChanged: (value) => cevapclick(value)),
                      RadioListTile(
                          title: Text(_listSorular[soruno].b),
                          value: "b",
                          groupValue: _groupvalue,
                          onChanged: (value) => cevapclick(value)),
                      RadioListTile(
                          title: Text(_listSorular[soruno].c),
                          value: "c",
                          groupValue: _groupvalue,
                          onChanged: (value) => cevapclick(value)),
                      RadioListTile(
                          title: Text(_listSorular[soruno].d),
                          value: "d",
                          groupValue: _groupvalue,
                          onChanged: (value) => cevapclick(value)),
                      Row(
                        children: [
                          ElevatedButton(
                              onPressed:
                                  soruno == 0 ? null : () => sorudegis(-1),
                              child: const Text("<")),
                          ElevatedButton(
                              onPressed:
                                  soruno == 2 ? null : () => sorudegis(1),
                              child: const Text(">"))
                        ],
                      ),
                      ElevatedButton(
                          onPressed: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Sonuc(_listSorular))),
                          child: const Text("Bitir"))
                    ],
                  ),
                );
              }

              return const CircularProgressIndicator();
            }));
  }
}
