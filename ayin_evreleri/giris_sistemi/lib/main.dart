import 'package:flutter/material.dart';
import 'package:giris_sistemi/anasayfa.dart';
import 'package:giris_sistemi/kayitekrani.dart';
import 'girisekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(GirisUygulamasi());

class GirisUygulamasi extends StatelessWidget {

  @override
  Widget build(BuildContext context){
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Giriş Uygulaması",
      home: GirisEkrani(),
    );
  }
}