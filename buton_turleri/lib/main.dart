import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          title: Text("Buton Türlerim"),
          backgroundColor: Colors.red,
        ),
      	body: Container(
					color: Colors.black,
					child: ButonTurleri(context),
				),
			)
    );
  }

  Widget ButonTurleri(BuildContext context){
    return Container(
			margin: EdgeInsets.all(25),
			color: Colors.indigoAccent,
      child: Column(
				mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          RaisedButton(
						onPressed: (){debugPrint("1. Butona tıklandı.");},
						child: Text("jgfhgfkjlkhlkjhlkjh kjgkj"),
					), 
					RaisedButton(
						onPressed: ()=> UzakFonksiyon(),
						child: Icon(Icons.account_box),
					),
					IconButton(
						onPressed: (){debugPrint("3. Butona tıklandı.");},
						color: Colors.white,
						iconSize: 50,
						icon: Icon(Icons.account_box),
					),
					FlatButton(
						onPressed: (){debugPrint("3. Butona tıklandı.");},
						child: Text("FlatBUTTTOOON"),
					),
        ],
      ),
    );
  }
}

void UzakFonksiyon(){
	debugPrint("Uzak Fonksiyon Çağrıldı.");
}