import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({
    super.key,
    required this.sayfaDegistir,
    required this.seciliSayfa,
  });
  final Function(int)? sayfaDegistir;
  final int seciliSayfa;

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context)
          .copyWith(canvasColor: const Color.fromARGB(255, 111, 110, 110)),
      child: BottomNavigationBar(
        currentIndex: widget.seciliSayfa,
        onTap: widget.sayfaDegistir,
        type: BottomNavigationBarType.fixed,
        fixedColor: Colors.white,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Anasayfa",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.data_array_outlined),
            label: "Değerlendirme",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Kullanıcı Girişi",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "İletişim",
          ),
        ],
      ),
    );
  }
}
