import 'package:flutter/material.dart';
import 'package:mobuyg1/sayfalar/etkinlikler.dart';
import 'package:mobuyg1/sayfalar/iletisim.dart';
import 'package:mobuyg1/sayfalar/kullanici_giris.dart';
import 'package:mobuyg1/sayfalar/sorular.dart';
import 'package:mobuyg1/sayfalar/takvim.dart';

class MyDrawer extends StatefulWidget {
  const MyDrawer({super.key});

  @override
  State<MyDrawer> createState() => _MyDrawerState();
}

class _MyDrawerState extends State<MyDrawer> {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 107, 108, 109),
            ),
            child: Text('Teknoloji Ve Tasarım Dersi'),
          ),
          ListTile(
            leading: const Icon(Icons.lock),
            title: const Text('Kullanıcı Girişi'),
            onTap: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const KullaniciGiris()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.calendar_month),
            title: const Text('Takvim'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Takvim()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.accessibility),
            title: const Text('Etkinlikler'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Etkinlikler()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.not_listed_location_outlined),
            title: const Text('Öğretmenden Notlar'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Notlar()));
            },
          ),
          ListTile(
            leading: const Icon(Icons.call),
            title: const Text('İletişim'),
            onTap: () {
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const Iletisim()));
            },
          ),
        ],
      ),
    );
  }
}
