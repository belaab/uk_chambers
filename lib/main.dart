import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: new ChambersList(),
    );
  }
}

class ChambersList extends StatefulWidget {
  @override
  ChambersListState createState() => ChambersListState();
}

class ChambersListState extends State<ChambersList> {
  List<String> chambersList = ["First", "Second", "Third"];

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        appBar: new AppBar(
          title: new Text("Chambers list"),
        ),
        body: chambersListItems() // ListView.builder() shall be used here.
    );
  }

  ListView chambersListItems() {
    return new ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: chambersList.length,
        itemBuilder: (BuildContext ctxt, int index) {
          return new Text(chambersList[index]);
        });
  }
}
