import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mobuyg1/sayfalar/ana_sayfa.dart';

class KullaniciGiris extends StatefulWidget {
  const KullaniciGiris({super.key});

  @override
  State<KullaniciGiris> createState() => _KullaniciGirisState();
}

class _KullaniciGirisState extends State<KullaniciGiris> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final _eposta = TextEditingController();
  final _sifre = TextEditingController();
  Future<void> kayit() async {
    try {
      User? user = (await _auth.createUserWithEmailAndPassword(
              email: _eposta.text, password: _sifre.text))
          .user;

      Fluttertoast.showToast(msg: "kayıt çalıştı ${user?.uid}");
    } on FirebaseAuthException catch (e) {
      if (e.code == "invalid-email") {
        Fluttertoast.showToast(msg: "geçersiz mail");
      } else if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "şifre geçersiz");
      } else if (e.code == "email-already-in-use") {
        Fluttertoast.showToast(msg: "Bu E posta kullanımda");
      }
    }
  }

  Future<void> giris(context) async {
    try {
      UserCredential userCredential = await _auth.signInWithEmailAndPassword(
          email: _eposta.text, password: _sifre.text);
      Fluttertoast.showToast(msg: "${userCredential.user?.uid}");
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => const AnaSayfa()));
    } on FirebaseAuthException catch (e) {
      if (e.code == "wrong-password") {
        Fluttertoast.showToast(msg: "geçersiz mail");
      } else if (e.code == "weak-password") {
        Fluttertoast.showToast(msg: "yanlış şifre");
      } else if (e.code == "user-not-found") {
        Fluttertoast.showToast(msg: "Kullanıcı bulunamadı");
      }
    }
  }

  bool _passgizle = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ana Sayfa"),
        backgroundColor: const Color.fromARGB(255, 71, 71, 71),
      ),
      backgroundColor: const Color.fromARGB(255, 207, 206, 205),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              margin: const EdgeInsets.all(20),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    TextFormField(
                      controller: _eposta,
                      decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.mail), hintText: "E-posta"),
                    ),
                    TextFormField(
                      controller: _sifre,
                      obscureText: _passgizle,
                      decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          hintText: "Şifre Giriniz",
                          suffixIcon: IconButton(
                            icon: Icon(_passgizle
                                ? Icons.visibility
                                : Icons.visibility_off),
                            onPressed: () {
                              setState(() {
                                _passgizle = !_passgizle;
                              });
                            },
                          )),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                            onPressed: () {
                              giris(context);
                            },
                            child: const Text("Giriş")),
                        const SizedBox(
                          width: 20,
                        ),
                        ElevatedButton(
                            onPressed: kayit,
                            child: const Text("Yeni Kullanıcı")),
                      ],
                    ),
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
