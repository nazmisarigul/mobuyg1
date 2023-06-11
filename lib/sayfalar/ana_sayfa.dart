import 'package:flutter/material.dart';
import 'package:mobuyg1/widgetler/bottum_bar.dart';
import 'package:mobuyg1/modeller/kart_model.dart';
import 'package:mobuyg1/sayfalar/degerlendirme.dart';
import 'package:mobuyg1/sayfalar/etkinlikler.dart';
import 'package:mobuyg1/sayfalar/iletisim.dart';
import 'package:mobuyg1/sayfalar/kullanici_giris.dart';
import 'package:mobuyg1/sayfalar/sorular.dart';
import 'package:mobuyg1/sayfalar/takvim.dart';
import 'package:mobuyg1/widgetler/drawer.dart';

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({super.key});

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> with TickerProviderStateMixin {
  List<KartModel> kartlar = [
    KartModel(
      1,
      "Takvim",
      Icons.calendar_month,
    ),
    KartModel(
      2,
      "Kullanıcı girişi",
      Icons.login,
    ),
    KartModel(
      3,
      "Degerlendirme",
      Icons.event_available,
    ),
    KartModel(
      4,
      "İletişim",
      Icons.phone,
    ),
    KartModel(
      5,
      "Etkinlikler",
      Icons.local_activity,
    ),
    KartModel(
      6,
      "Notlar",
      Icons.question_mark_outlined,
    )
  ];

  void kartaTikla(int index) {
    switch (index) {
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Takvim()));
        break;
      case 2:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const KullaniciGiris()));
        break;
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Degerlendirme()));
        break;
      case 4:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Iletisim()));
        break;
      case 5:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Etkinlikler()));
        break;
      case 6:
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => const Notlar()));
        break;
      default:
        break;
    }
  }

  Widget kartWidget(KartModel kart) {
    return InkWell(
      onTap: () {
        kartaTikla(kart.index);
      },
      child: Container(
        alignment: Alignment.bottomCenter,
        width: MediaQuery.of(context).size.width / 2.2,
        height: MediaQuery.of(context).size.height / 5,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: Image.asset("assets/images/${kart.index}.png").image,
            fit: BoxFit.fill,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        child: Container(
          padding: const EdgeInsets.all(3),
          decoration: const BoxDecoration(
            color: Colors.black12,
            borderRadius: BorderRadius.all(Radius.circular(8)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                kart.ad,
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
              Icon(
                kart.iconData,
                color: Colors.white,
              ),
            ],
          ),
        ),
      ),
    );
  }

  int seciliSayfa = 0;

  void sayfaDegistir(int index) {
    seciliSayfa = index;
    tabController.animateTo(index);
    setState(() {});
  }

  late TabController tabController;
  @override
  void initState() {
    tabController = TabController(length: 4, vsync: this);

    tabController.addListener(() {
      if (mounted && seciliSayfa != tabController.index) {
        seciliSayfa = tabController.index;
        setState(() {});
      }
    });

    super.initState();
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        backgroundColor: const Color.fromARGB(255, 92, 53, 53),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 206, 205),
      drawer: const MyDrawer(),
      body: TabBarView(controller: tabController, children: [
        anaSayfa(),
        const Degerlendirme(),
        const KullaniciGiris(),
        const Iletisim()
      ]),
      bottomNavigationBar: BottomBar(
        sayfaDegistir: (sayfa) {
          sayfaDegistir(sayfa);
        },
        seciliSayfa: seciliSayfa,
      ),
    );
  }

  SingleChildScrollView anaSayfa() {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                children: [
                  for (var kart in kartlar) kartWidget(kart),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
