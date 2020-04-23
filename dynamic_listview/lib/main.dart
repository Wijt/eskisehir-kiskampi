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
    /*final ulkeler=["Türkiye","Polonya","Polonya","Polonya","Polonya","Polonya","Polonya","Polonya","Polonya","Polonya","Polonya",];
    return ListView.builder(
      itemCount: ulkeler.length,
      itemBuilder: (context,index){
        return ListTile(
          title: Text(ulkeler[index]),
          subtitle: Text("ülke"),
        );
      },
    );*/
    return Center(
      child: Column(
        children: <Widget>[
          Card(
            margin: EdgeInsets.all(20),
            elevation: 20,
            color: Colors.lightBlue,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("Furkan Kaya"),
              subtitle: Text("Yazılımcı"),
              trailing: Icon(Icons.add_box),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            elevation: 20,
            color: Colors.lightBlue,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("Furkan Kaya"),
              subtitle: Text("Yazılımcı"),
              trailing: Icon(Icons.add_box),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            elevation: 20,
            color: Colors.lightBlue,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("Furkan Kaya"),
              subtitle: Text("Yazılımcı"),
              trailing: Icon(Icons.add_box),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            elevation: 20,
            color: Colors.lightBlue,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("Furkan Kaya"),
              subtitle: Text("Yazılımcı"),
              trailing: Icon(Icons.add_box),
            ),
          ),
          Card(
            margin: EdgeInsets.all(20),
            elevation: 20,
            color: Colors.lightBlue,
            child: ListTile(
              leading: CircleAvatar(child: Icon(Icons.person),),
              title: Text("Furkan Kaya"),
              subtitle: Text("Yazılımcı"),
              trailing: Icon(Icons.add_box),
            ),
          ) 
        ]
      )
    );
  }
}