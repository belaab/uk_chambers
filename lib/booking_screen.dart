import 'package:flutter/material.dart';

class BookingScreen extends StatelessWidget {
  final String title;

  BookingScreen(this.title);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
    );
  }
}
