import 'package:flutter/material.dart';
import 'event.dart';

import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';
import 'package:intl/intl.dart';

class BookingScreen extends StatefulWidget {
  final String title;

  BookingScreen(this.title);
  @override
  BookingScreenState createState() => BookingScreenState(title);
}

class BookingScreenState extends State<BookingScreen> {
  final String title;
  final _formKey = GlobalKey();
  final event = Event();

  final dateFormat = DateFormat("EEEE, MMMM d, yyyy 'at' h:mma");
  final timeFormat = DateFormat("h:mm a");
  DateTime date;
  BookingScreenState(this.title);

  @override
  Widget build(BuildContext context) {
  return Scaffold(
        appBar: AppBar(title: Text(title)),
        body: Container(
            padding:
                const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
            child: Builder(
                builder: (context) => Form(
                    key: _formKey,
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          TextFormField(
                            decoration: InputDecoration(labelText: 'Event name:'),
                            validator: (value) { 
                              if (value.isEmpty) {
                                return 'Please enter event name.';
                              }
                            },
                            onSaved: (val) =>
                                setState(() => event.name = val),
                          ),
                          TextFormField(
                              decoration:
                                  InputDecoration(labelText: 'Your name:'),
                              validator: (value) {
                                if (value.isEmpty) {
                                  return "Leave your identity :)";
                                }
                              },
                              onSaved: (val) => setState(() => event.creator = val)),
                           DateTimePickerFormField(
                              inputType: InputType.both,
                               format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                               editable: false,
                               decoration: InputDecoration(
                              labelText: 'start hour',
                              hasFloatingPlaceholder: false
                            ),
                             onChanged: (dt) {
                                setState(() => event.dateStart = dt);
                                print('Selected date: $dt');
                            },
                           ),
                            DateTimePickerFormField(
                              inputType: InputType.both,
                               format: DateFormat("EEEE, MMMM d, yyyy 'at' h:mma"),
                               editable: false,
                               decoration: InputDecoration(
                              labelText: 'Estimated end time',
                              hasFloatingPlaceholder: false
                            ),
                             onChanged: (dt) {
                                setState(() => event.dateEnd = dt);
                                print('Selected date: $dt');
                            },
                           ),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: Text(''),
                          ),
                          SwitchListTile(
                              title: const Text('cyclic'),
                              value: event.cycle,
                              onChanged: (bool val) =>
                                  setState(() => event.cycle = val)),
                          Container(
                            padding: const EdgeInsets.fromLTRB(0, 50, 0, 20),
                            child: Text('Needed:'),
                          ),
                          CheckboxListTile(
                              title: const Text('Apple TV'),
                              value: event.neededFeatures[Event.AppleTV],
                              onChanged: (val) {
                                setState(() =>
                                    event.neededFeatures[Event.AppleTV] = val);
                              }),
                          CheckboxListTile(
                              title: const Text('Microphone'),
                              value: event.neededFeatures[Event.Microphone],
                              onChanged: (val) {
                                setState(() => event.neededFeatures[Event.Microphone] = val);
                              }),
                          Container(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 16.0, horizontal: 16.0),
                              child: RaisedButton(
                                  onPressed: () {
                                    final form = _formKey.currentState;
                                    // if (form.validate() ) {
                                    //   form.save();
                                      event.save();
                                      _showDialog(context);
                                    //}
                                  },
                                  child: Text('Save'))),
                        ])))));
  }

  _showDialog(BuildContext context) {
    Scaffold.of(context)
        .showSnackBar(SnackBar(content: Text("UK's 🏰 chamber reserved")));
  }

}
