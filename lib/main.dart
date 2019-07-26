import 'package:flutter/material.dart';
import 'booking_screen.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:datetime_picker_formfield/time_picker_formfield.dart';
import 'package:intl/intl.dart';

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
  List<String> chambersList = ["Green", "White", "BIG"];

  @override
  Widget build(BuildContext ctxt) {
    return new Scaffold(
        body: chambersListItems() // ListView.builder() shall be used here.
        );
  }

  ListView chambersListItems() {
    return new ListView.separated(
      itemCount: chambersList.length,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        return InkWell(
          child: singleRowContainer(context, index),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) =>  BookingScreen(chambersList[index])),
            );
          },
        );
      },
      separatorBuilder: (BuildContext context, int index) {
        return Divider(
          height: 2,
        );
      },
    );
  }

  Container singleRowContainer(BuildContext context, int index) {
    return Container(
      height: MediaQuery.of(context).size.height / 3 - 6,
      child: Center(child: Text(chambersList[index])),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/uk-logo.jpg"),
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
