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
    return new ListView.separated(
      padding: const EdgeInsets.all(16),
      itemCount: chambersList.length,
      itemBuilder: (context, index) {
        return Container(
          height: 50,
          child: Center(child: Text(chambersList[index])),
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider();
      },
    );
  }
}
