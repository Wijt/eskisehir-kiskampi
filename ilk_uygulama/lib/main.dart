import 'package:flutter/material.dart'; //temel widget kütüphanesi

void main (){
  runApp(MyApp());
}

  class MyApp extends StatefulWidget{

    State<StatefulWidget> createState() => MyApp2();

  }
  
class MyApp2 extends State<MyApp>{
    @override
    Widget build(BuildContext context) {
        return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: new Scaffold(
                body: Container(
                    color: Colors.black,
                    child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                        Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
                            FloatingActionButton(),
                            FloatingActionButton(),
                            FloatingActionButton(),
                            FloatingActionButton(),
                            FloatingActionButton()
                        ],),
                        FloatingActionButton(),
                        FloatingActionButton(),
                        FloatingActionButton()
                    ],
                ),
                )
            ),
        );
    }
}