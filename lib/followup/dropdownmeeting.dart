import 'package:flutter/material.dart';
class Activitytype extends StatefulWidget {
  Activitytype({Key key}) : super(key: key);

  @override
  _ActivitytypeState createState() => _ActivitytypeState();
}

/// This is the private State class that goes with Activitytype.
class _ActivitytypeState extends State<Activitytype> {
  String dropdownValue = 'Call';

  @override
  Widget build(BuildContext context) {
    return DropdownButton<String>(
      value: dropdownValue,
      icon: Icon(Icons.arrow_downward),
      iconSize: 24,
      elevation: 16,
      style: TextStyle(color: Colors.deepPurple),
      underline: Container(
        height: 2,
        color: Colors.black,
      ),
      onChanged: (String newValue) {
        setState(() {
          dropdownValue = newValue;
        });
      },
      items: <String>['Call', 'Meeting', 'Others']
          .map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}
