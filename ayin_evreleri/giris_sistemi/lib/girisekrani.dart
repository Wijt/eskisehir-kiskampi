import 'package:flutter/material.dart';
import 'package:giris_sistemi/anasayfa.dart';
import 'package:giris_sistemi/kayitekrani.dart';
import 'package:firebase_auth/firebase_auth.dart';

class GirisEkrani extends StatelessWidget {
  final nicknameController = TextEditingController();
  final sifreController = TextEditingController();

  var context = null;

  AppBar appBarOlustur(){
    return AppBar(
      title: Center(child: Text("LOGIN")),
      backgroundColor: Colors.black,
    );
  }

  Padding logoOlustur(){
    return Padding(
      padding: EdgeInsets.all(50),
      child: Icon(
        Icons.account_circle,
        color: Colors.white,
        size: 200,
      )
    );
  }
  
  Padding inputlariOlustur(){
    return Padding(
      padding: EdgeInsets.all(25),
      child: Column(children: <Widget>[
        TextField(
          style: new TextStyle(color: Colors.black),
          keyboardType: TextInputType.text,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Nickname",
            prefixIcon: Icon(Icons.alternate_email)
          ),
          controller: nicknameController,
        ),
        Padding(padding: EdgeInsets.all(5)),
        TextField(
          style: new TextStyle(color: Colors.black),
          keyboardType: TextInputType.visiblePassword,
          obscureText: true,
          decoration: InputDecoration(
            fillColor: Colors.white,
            filled: true,
            hintText: "Password",
            prefixIcon: Icon(Icons.vpn_key)
          ),
          controller: sifreController,
        )
      ],),
    );
  }

  final _auth = FirebaseAuth.instance;

  Padding girisYapButonuOlustur(){
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 5),
      child: Container(
        width: 100,
        child: RaisedButton(
          onPressed: (){
            _auth.signInWithEmailAndPassword(email: nicknameController.text, password: sifreController.text).then((result){
              debugPrint(result.toString() + "giriş DURUMU");
              Navigator.push(this.context, MaterialPageRoute(builder: (context)=>Anasayfa()));
            }).catchError((hata)=>debugPrint(hata.toString()));
          },
          color: Colors.white,
          textColor: Colors.black,
          child: Text("Login"),
        ),
      ),
    );
  }

  Padding kayidaGitButonuOlustur(){
    return Padding(
      padding: EdgeInsets.all(0),
      child: FlatButton(
        onPressed: (){
          Navigator.push(this.context, MaterialPageRoute(builder: (context)=>KayitEkrani()));
        },
        textColor: Colors.white,
        child: Text("Register"),
      ),
    );
  }


  @override
  Widget build(BuildContext context){
    this.context = context;
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: appBarOlustur(),
        body: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              logoOlustur(),
              inputlariOlustur(),
              girisYapButonuOlustur(),
              kayidaGitButonuOlustur()
            ]),
        )
      )
    );
  }
}
