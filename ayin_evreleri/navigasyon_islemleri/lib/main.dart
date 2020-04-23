import 'package:flutter/material.dart';
import 'package:navigasyon_islemleri/verili_sayfa.dart';
import 'package:navigasyon_islemleri/yeni_sayfa.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget { 
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
     home: Scaffold(
       appBar: AppBar(
         title: Text("Navigasyon İşlemleri"),
         backgroundColor: Colors.yellow,
       ),
       body: NavigasyonIslemleri(),
     ),
    );

  }
}

class NavigasyonIslemleri extends StatelessWidget{

  String gonderilenVeri = "Navigasyon işlemleri Sayfasından Geldim! :)";

  @override
  Widget build(BuildContext context) {



    return Container(
      width: 1000,
      color: Colors.black,
      child: Column(
        children: <Widget>[
          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => ASayfasi())); // Diğer sayfaya yönlendiriyoruz
            },
            child: Text("A sayfasına git"),
            color: Colors.red[200],
          ),

          RaisedButton(
            onPressed: (){
              Navigator.push(context, MaterialPageRoute(builder: (context) => BSayfasi(gonderilenVeri)));
            },
            child: Text("B sayfasına veri gönder"),
            color: Colors.blue[200],
          ),

          RaisedButton(
            onPressed: (){

            },
            child: Text(""),
            color: Colors.orange[200],
          ),
        ],
      ),
    );
  }

}
