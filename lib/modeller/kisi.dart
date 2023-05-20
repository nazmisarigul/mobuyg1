import 'dart:convert';

Kisi kisiFormJson(String str) => Kisi.formJson(json.decode(str));
String kisiToJson(Kisi data) => json.encode(data.toJson());

class Kisi {
  Kisi({
    required this.adi,
    required this.soyadi,
    required this.mesaj,
  });

  String adi;
  String soyadi;
  String mesaj;
  factory Kisi.formJson(Map<String, dynamic> json) => Kisi(
        adi: json["Adi"],
        soyadi: json["Soyadi"],
        mesaj: json["mesaj"],
      );
  Map<String, dynamic> toJson() => {
        "Adi": adi,
        "Soyadi": soyadi,
        "mesaj": mesaj,
      };
}
