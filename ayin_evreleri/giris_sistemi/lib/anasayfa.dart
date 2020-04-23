import 'package:flutter/material.dart';
import 'package:giris_sistemi/kayitekrani.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Anasayfa extends StatefulWidget {
  
  final nicknameController = TextEditingController();
  final sifreController = TextEditingController();
  var context=null;

  AppBar appBarOlustur(){
    return AppBar(
      title: Center(child: Text("ANASAYFA",
        style: TextStyle(color: Colors.teal[100]),
      )),
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

  Padding girisYapButonuOlustur(){
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 5),
      child: Container(
        width: 100,
        child: RaisedButton(
          onPressed: (){
            if(nicknameController.text=="Furkan"&& sifreController.text=="111"){
              debugPrint("Girildi he");
              Navigator.push(this.context, MaterialPageRoute(builder: (context)=>KayitEkrani()));
            }
            else{
              debugPrint("Aga tekrar dene");
            }
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
    
  }

  @override
  State<StatefulWidget> createState() {
    this.context = context;
    return Icerik();
  }
}

class Icerik extends State<StatefulWidget>{
  String girilenVeri="";

  final _firestore = Firestore.instance;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Login App",
      home: Scaffold(
        backgroundColor: Colors.black,
        appBar: Anasayfa().appBarOlustur(),
        body: SingleChildScrollView(
          padding: EdgeInsets.all(25),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                RaisedButton(
                  color: Colors.teal[200],
                  onPressed: (){
                    Map<String, dynamic> ogrenci = Map();
                    ogrenci["isim"]="Furkan";
                    ogrenci["yas"]=19;
                    _firestore.collection("users").document("ogrenci").setData(ogrenci);    
                  },
                  child: Text("Veri Oluştur"),
                ),
                RaisedButton(
                  color: Colors.teal[400],
                  onPressed: (){},
                  child: Text("Veri Okuma"),
                ),
                RaisedButton(
                  color: Colors.teal[600],
                  onPressed: (){},
                  child: Text("Veri Silme"),
                ),
                RaisedButton(
                  color: Colors.teal[800],
                  onPressed: (){},
                  child: Text("Veri Güncelleme"),
                )
              ],
            ),
          ),
        )
      )
    );
  }
  
}