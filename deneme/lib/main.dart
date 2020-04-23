import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:io';
import 'dart:async';


List<Satir> satirlar=[];


void main(){
  verileriAl();
  
  print("Yazılmış olmalı.");
  //runApp(ServicePetrolPage());
}

class Satir {
  final String ulke;
  final String sehir;
  final String tarih;
  final String hasta;
  final String iyilesme;
  final String olum;

  Satir(this.ulke, this.sehir, this.hasta, this.iyilesme, this.olum, this.tarih);
  
  @override
  String toString(){
    return this.ulke + ", " 
    + this.sehir + ", " 
    + this.hasta + ", " 
    + this.iyilesme + ", " 
    + this.olum + ", " 
    + this.tarih;
  }
}



void verileriAl() async{
  var a = await RequestHandler.post("http://virusmap.net/verial.php", {});
  var jsondata = json.decode(a);
  for (var u in jsondata) {
    Satir asatir = new Satir(u["Ulke"], u["Sehir"], u["Hasta"], u["Iyilesme"], u["Olum"], u["Tarih"]);
    satirlar.add(asatir);
  }
  print("Veriler listeye alındı.");
  /*print(satirlar.length);
  for(Satir i in satirlar){
    print(i);
  }*/
  runApp(MyApp());
}

class RequestHandler{
  static Future<String> post(String url, Map<String, String> body) async {
    try {
      final response = await http.post(
        url,
        body: body
      );
      print("Veriler siteden çekildi.");
      return utf8.decode(response.bodyBytes);
    } catch (exception, stackTrace) {
      print(exception.toString() + " Sunucuyaa Bağlanamadı!");
    }
  }
}


class MyApp extends StatefulWidget {
  @override
  _MyApp createState() => _MyApp();
}

class _MyApp extends State<MyApp>{
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          padding: EdgeInsets.all(25),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                DataTable(
                  columns: [
                    DataColumn(label: Text('Ülke', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Şehir', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Onaylanmış Hasta', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('İyileşen Sayısı', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Ölen Sayısı', style: TextStyle(fontWeight: FontWeight.bold))),
                    DataColumn(label: Text('Güncellenme Tarihi', style: TextStyle(fontWeight: FontWeight.bold))),
                  ],
                  rows: satirlar.map(
                          ((element) => DataRow(
                            cells: <DataCell>[
                              DataCell(Text(element.ulke)),
                              DataCell(Text(element.sehir ?? "Bilinmiyor")),
                              DataCell(Text(element.hasta)),
                              DataCell(Text(element.iyilesme)),
                              DataCell(Text(element.olum)),
                              DataCell(Text(element.tarih))
                            ]
                          ))
                        ).toList(),
                )
              ],),
          ),
        )
      ),
    );
  }
}

class ServicePetrolPage extends StatefulWidget {
//  HomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

//  final String title;

  @override
  _ServicePetrolPage createState() => _ServicePetrolPage();
}

class _ServicePetrolPage extends State<ServicePetrolPage> {
  int _counter = 0;
  String dropdownValue1 = "Shell";
  String dropdownValue2 = "Nearest";
  String dropdownValue3 = "Restaurant";
  List<PetrolItem> _petrolList;

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  FetchPetrolList() async {
    var data = await http.get("http://157.230.131.4/gda-api-dev/petrol.php");
    var jsonData = json.decode(data.body);

    List<PetrolItem> petrolList = [];

    for (var u in jsonData) {
      PetrolItem petrol = PetrolItem(u["logo"], u["location"], u["distance"], u["price"], u["facilities"]);
      petrolList.add(petrol);
      print(petrol.logo+" "+petrol.location+" "+petrol.distance+" "+petrol.price+" "+petrol.facilities);
    }

    this.setState(() {
      _petrolList = petrolList;
    });

  }
  
  @override
  void initState() {
    FetchPetrolList();
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text('Petrol'),
      ),
      body: Container(
          child: SafeArea(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:
                Column(mainAxisAlignment: MainAxisAlignment.spaceAround, children: 
                 <Widget>[
                  SizedBox(
                    height: 120,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        SizedBox(
                          child: Row(
                            children: <Widget>[
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: DropdownButton<String>(
                                      value: dropdownValue1,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue1 = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Shell',
                                        'Esso',
                                        'Castrol',
                                        'Four'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      isExpanded: false,
                                      hint: Text("Brand")),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: DropdownButton<String>(
                                      value: dropdownValue2,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue2 = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'Nearest',
                                        'Farthest'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      hint: Text("Location")),
                                ),
                              ),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(horizontal: 3),
                                  child: DropdownButton<String>(
                                      value: dropdownValue3,
                                      onChanged: (String newValue) {
                                        setState(() {
                                          dropdownValue3 = newValue;
                                        });
                                      },
                                      items: <String>[
                                        'ATM',
                                        'Restaurant',
                                        'Toilet'
                                      ].map<DropdownMenuItem<String>>((String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                      hint: Text("Facilities")),
                                ),
                              ),
                            ],
                          ),
                        ),
                        new Text("All brands > Wan Chai Stn > Cheapest",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ],
                    ),
                  ),
                  DataTable(
                    columns: [
                      DataColumn(label: Text('Logo')),
                      DataColumn(label: Text('Location')),
                      DataColumn(label: Text('Distance')),
                      DataColumn(label: Text('Price')),
                      DataColumn(label: Text('Facilities')),
                    ],
                    sortColumnIndex: 1,
                    rows:
                    _petrolList
                        .map(
                      ((element) => DataRow(
                        cells: <DataCell>[
                          DataCell(Image.asset("assets/images/"+element.logo)),
                          DataCell(Text(element.location)),
                          DataCell(Text(element.distance)),
                          DataCell(Text(element.price)),
                          DataCell(Text(element.facilities)),
                        ],
                      )),
                    ).toList(),
                  ),
                ]),
              ))),
    );
  }

  BoxDecoration myBottomBorder() {
    return BoxDecoration(
      border: Border(
        bottom: BorderSide(
          color: Colors.black,
          width: 1.5,
        ),
      ),
    );
  }
}

class PetrolItem {
  final String logo;
  final String location;
  final String distance;
  final String price;
  final String facilities;

  PetrolItem(this.logo, this.location, this.distance, this.price, this.facilities);

}