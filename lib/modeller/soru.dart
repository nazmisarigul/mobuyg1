import 'dart:convert';

Welcome welcomeFromJson(String str) => Welcome.fromJson(json.decode(str));

String welcomeToJson(Welcome data) => json.encode(data.toJson());

class Welcome {
  String soru;
  String a;
  String b;
  String c;
  String d;
  String dCevap;
  String yDonut;
  int puan;
  String ocevap;

  Welcome({
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

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
        soru: json["Soru"],
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
        "Soru": soru,
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
