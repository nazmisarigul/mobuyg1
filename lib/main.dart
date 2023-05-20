import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobuyg1/sayfalar/ana_sayfa.dart';
import 'package:mobuyg1/sayfalar/degerlendirme.dart';
import 'package:mobuyg1/sayfalar/etkinlikler.dart';
import 'package:mobuyg1/sayfalar/iletisim.dart';
import 'package:mobuyg1/sayfalar/kullanici_giris.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(
    MaterialApp(routes: {
      "/": (context) => const AnaSayfa(),
      "/Etkinlikler": (context) => const Etkinlikler(),
      "/iletisim": (context) => const Iletisim(),
      "/Degerlendirme": (context) => const Degerlendirme(),
      "/KullaniciGirisi": (context) => const KullaniciGiris(),
    }),
  );
}
