import 'dart:convert';

SorularCls SorularClsFromJson(String str) =>
    SorularCls.fromJson(json.decode(str));

String SorularClsToJson(SorularCls data) => json.encode(data.toJson());

class SorularCls {
  String soru;
  String a;
  String b;
  String c;
  String d;
  String dCevap;
  String yDonut;
  int puan;
  String ocevap;

  SorularCls({
    required this.soru,
    required this.a,
    required this.b,
    required this.c,
    required this.d,
    required this.dCevap,
    required this.yDonut,
    required this.puan,
    required this.ocevap,
  });

  factory SorularCls.fromJson(Map<String, dynamic> json) => SorularCls(
        soru: json["soru"],
        a: json["a"],
        b: json["b"],
        c: json["c"],
        d: json["d"],
        dCevap: json["dCevap"],
        yDonut: json["yDonut"],
        puan: json["puan"],
        ocevap: json["ocevap"],
      );

  Map<String, dynamic> toJson() => {
        "soru": soru,
        "a": a,
        "b": b,
        "c": c,
        "d": d,
        "dCevap": dCevap,
        "yDonut": yDonut,
        "puan": puan,
        "ocevap": ocevap,
      };
}
