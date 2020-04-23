import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.purple
      ),
      home: Scaffold(
        appBar: AppBar(backgroundColor: Colors.black),
        body: ImageTurleri(),
      ),
    );
  }
}

class ImageTurleri extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amberAccent,
      width: double.infinity,
      height: MediaQuery.of(context).size.height,
      child: Column(
        children: <Widget>[
          Row(
            children: <Widget>[
              Container(
                height: 45,
                child: Image.asset("resimler/adam.png"),
              ),
              Container(
                height: 45,
                child: Image.asset("resimler/adam.png"),
              ),
              Container(
                height: 45,
                child: Image.asset("resimler/adam.png"),
              )
            ],
          )
        ],
      ),
    );
  }
}