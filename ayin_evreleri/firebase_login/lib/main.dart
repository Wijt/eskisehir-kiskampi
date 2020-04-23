import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("İnput İşlemleri"),
        ),
        body: Center(
          child: Column(
          children: <Widget>[
            Image.asset("lock.png"),
            TextField(
              keyboardType: TextInputType.text,
              maxLength: 5,
              maxLines: 3,
            ),
          ],
        ),),
      ),
    );
  }
}