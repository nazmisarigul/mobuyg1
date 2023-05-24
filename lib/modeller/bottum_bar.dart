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
      data: Theme.of(context).copyWith(canvasColor: Colors.redAccent),
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
            icon: Icon(Icons.last_page),
            label: "Anasayfa2",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.list),
            label: "Anasayfa3",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.contact_phone),
            label: "Anasayfa4",
          ),
        ],
      ),
    );
  }
}
