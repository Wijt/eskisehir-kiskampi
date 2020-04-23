import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Flutter'da ListView",
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Liste(context),
    );
  }
  
  Widget Liste(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Deneme"),
      ),
      body: Center(
        child: Container(
          child: _myListView(context),
        )
      )
    );
  }

  @override
  Widget _myListView(BuildContext context){
  return ListView(
    children: ListTile.divideTiles(
      context: context,
      tiles: [
        ListTile(
          leading: CircleAvatar(
            child: Icon(Icons.account_circle),
          ),
          title: Text("Furkan Kaya"),
          trailing: Icon(Icons.arrow_forward_ios),
        ),
        ListTile(
          title: Text("Acemi")
        ),
        ListTile(
          title: Text("Usta")
        ),
        ListTile(
          title: Text("Kalfa")
        )
      ]
    ).toList()
  );
}

}

