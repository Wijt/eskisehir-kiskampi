import 'package:flutter/material.dart';
import 'package:image/image.dart' as prefix0;

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ayın Evreleri Uygulaması"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Text('Ayın Evreleri:', style: Theme.of(context).textTheme.display1),
            Row(children: AylarYanYana(context))
          ]
        ),
      )
    );
  } 

  List<Widget> AylarYanYana(BuildContext context) {
    List<Widget> ayResimleri = new List<Widget>();
    for (var i = 0; i < 7; i++) {
      //prefix0.Image kirpiliResim = prefix0.copyCrop(Image.assest("ayin_evreleri.png"), 0, (i*268), 203, 268);
      ayResimleri.add(
        Positioned(
          width: MediaQuery.of(context).size.width,
          top: MediaQuery.of(context).size.width * 0.30,//TRY TO CHANGE THIS **0.30** value to achieve your goal 
          child: Container(
            margin: EdgeInsets.all(16.0),
            child:Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Image.asset('resimler/ayin_evreleri.png', scale: 2.5),
                  SizedBox(height: 20,),
                ]
            ),
          )
        )
      );
    }
    return ayResimleri;
  }
}