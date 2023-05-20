import 'package:flutter/material.dart';

class BottomBar extends StatefulWidget {
  const BottomBar({super.key});

  @override
  State<BottomBar> createState() => _BottomBarState();
}

class _BottomBarState extends State<BottomBar> {
  int seciliSayfa = 0;

  void sayfaDegistir(int index) {
    setState(() {
      seciliSayfa = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Theme(
            data: Theme.of(context).copyWith(canvasColor: Colors.redAccent),
            child: BottomNavigationBar(
              currentIndex: seciliSayfa,
              onTap: sayfaDegistir,
              type: BottomNavigationBarType.fixed,
              fixedColor: Colors.white,
              items: const <BottomNavigationBarItem>[
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.last_page),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.list),
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.contact_phone),
                ),
              ],
            )));
  }
}
