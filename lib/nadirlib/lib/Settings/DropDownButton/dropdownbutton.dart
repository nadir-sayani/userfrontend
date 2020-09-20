import 'package:flutter/material.dart';


void main() => runApp(MyApp());

/// This Widget is the main application widget.
class MyApp extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: Center(
          child: DropSound(),
        ),
      ),
    );
  }
}

class DropSound extends StatefulWidget {
  DropSound({Key key}) : super(key: key);

  @override
  _DropSoundState createState() => _DropSoundState();
}

class _DropSoundState extends State<DropSound> {
  String dropdownValue = 'On';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(

      value: dropdownValue,
      icon: Icon(Icons.arrow_drop_down),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.black),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['On', 'Off', 'Vibrate']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
