import 'package:flutter/material.dart';
import 'package:giris_sistemi/girisekrani.dart';

class KayitEkrani extends StatelessWidget {
  var context = null;
  AppBar appBarOlustur(){
    return AppBar(
      title: Center(child: Text("REGISTER")),
      backgroundColor: Colors.black,
    );
  }

  Padding kayitLogoOlustur(){
    return Padding(
      padding: EdgeInsets.all(5),
      child: Icon(
        Icons.recent_actors,
        color: Colors.white,
        size: 100,
      )
    );
  }

  Padding giriseGitButonuOlustur(){
    return Padding(
      padding: EdgeInsets.all(0),
      child: FlatButton(
        onPressed: (){
          Navigator.pop(this.context, MaterialPageRoute(builder: (context) => GirisEkrani()));
        },
        textColor: Colors.white,
        child: Text("Login"),
      ),
    );
  }

  Padding kayitYapButonuOlustur(){
    return Padding(
      padding: EdgeInsets.fromLTRB(25, 25, 25, 5),
      child: Container(
        width: 100,
        child: RaisedButton(
          onPressed: ()=>{},
          color: Colors.white,
          textColor: Colors.black,
          child: Text("Register"),
        ),
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
        appBar: appBarOlustur(),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height - kToolbarHeight - 24,
            color: Colors.black,
            child: Column(children: <Widget>[
              Row(children: <Widget>[
                Expanded(flex:1, child: kayitLogoOlustur()),
                Expanded(
                  flex: 2,
                  child: Container(
                    padding: EdgeInsets.only(right:10),
                    child: Column(
                      children: <Widget>[
                        TextField(
                          style: new TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Nickname",
                            prefixIcon: Icon(Icons.alternate_email)
                          ),
                        ),
                        Padding(padding: EdgeInsets.only(top: 5),),
                        TextField(
                          style: new TextStyle(color: Colors.black),
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            fillColor: Colors.white,
                            filled: true,
                            hintText: "Full Name",
                            prefixIcon: Icon(Icons.person)
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: new TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "E-mail",
                    prefixIcon: Icon(Icons.alternate_email)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: new TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Password",
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  style: new TextStyle(color: Colors.black),
                  keyboardType: TextInputType.text,
                  obscureText: true,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    filled: true,
                    hintText: "Repassword",
                    prefixIcon: Icon(Icons.lock)
                  ),
                ),
              ),
              kayitYapButonuOlustur(),
              giriseGitButonuOlustur()
            ],)
          ),
        ),
      ),
    );
  }
}
