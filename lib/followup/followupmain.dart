import 'package:flutter/material.dart';
import 'customer.dart';
import 'package:slider_button/slider_button.dart';
import 'dropdownmeeting.dart';


import 'date_time_form.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main()
{ runApp( new MaterialApp(home: Followup(),
  debugShowCheckedModeBanner: false,
  localizationsDelegates: [
    GlobalWidgetsLocalizations.delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
  ],
  supportedLocales: [Locale('en', 'US')],
));}


class Followup extends StatefulWidget {
  @override
  _FollowupState createState() => _FollowupState();
}

class _FollowupState extends State<Followup> {
  @override
  Widget build(BuildContext context) {
    return Scaffold( appBar: new AppBar( elevation: 0.1,
    title: Text(" Follow-ups"),
    centerTitle: true,
    actions:  <Widget>[
    new IconButton(
    icon:Icon(Icons.search) ,
    onPressed: () {}

    ),

    ]
    ),
      body:/*SingleChildScrollView(scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:*/
      ListView(
          children: <Widget>[
      Padding(padding: EdgeInsets.all(10),
      child: Row(children: <Widget>[InkWell(child: Container(child: Align(alignment:Alignment.centerLeft,child: Text("Customer Name")),),onTap: (){ Navigator.of(context).push(new MaterialPageRoute(
          builder: (context) =>new CustomerList() ));

      },),
      ]),),
    const Divider(
    color: Colors.black26,
    height: 1,
    thickness: 1,
    indent: 0,
    endIndent: 0,
    ),

    ButtonBar(
    alignment: MainAxisAlignment.start,
    children: [MaterialButton(minWidth: 30,
    child: Text('Add Follow Up', style: TextStyle(fontSize: 15.0),),

    color: Colors.redAccent,
    splashColor: Colors.red,
    textColor: Colors.white,
    onPressed: () {},
    ),



    ],
    ),
    const Divider(
    color: Colors.black26,
    height: 1,
    thickness: 1,
    indent: 0,
    endIndent: 0,
    ),
    Padding(padding: EdgeInsets.all(10),
    child: Container(child: Align(alignment:Alignment.center,child: Text("Follow Up no 1")),),),
    Container(child: Followupform(),) ,
            Padding(padding: EdgeInsets.all(10),),
            Container(child:Row(children: <Widget>[Text("Alarm:"),Padding(padding: EdgeInsets.all(5),),SliderButton(
              /*action: () {
                ///Do something here
                Navigator.of(context).pop();
              },*/
              height: 50,
              width: 100,
              buttonSize: 40,
              dismissible: false,
              shimmer: false,
              label: Text(
                " Alarm",
                style: TextStyle(
                    color: Color(0xff4a4a4a),  fontSize: 10),
              ),
              icon: Icon(Icons.alarm)


            )])
            ),
            Padding(padding: EdgeInsets.all(10),),
            Row(children: <Widget>[Text("Activity:"),Padding(padding: EdgeInsets.all(5)),Activitytype()],),
            Padding(padding: EdgeInsets.all(10),),
       TextFormField(
    decoration: InputDecoration(
      icon: Icon(Icons.note_add),

    labelText: 'Enter Note'
    ),
    ),
            ButtonBar(//alignment: MainAxisAlignment.center,
                children: [FlatButton(
                  child: Text('Edit', style: TextStyle(fontSize: 15.0),),
                  color: Colors.green,
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                 /* onPressed: () {Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => MyProducts()),*/
                  ),


                  FlatButton(

                    child: Text('Save', style: TextStyle(fontSize: 15.0),),
                    color: Colors.green,
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                    onPressed: () {},
                  ),


                ]),
    ButtonBar(//alignment: MainAxisAlignment.center,
    children: [FlatButton(
    child: Text('Delete', style: TextStyle(fontSize: 15.0),),
    color: Colors.red,
    splashColor: Colors.redAccent,
    textColor: Colors.white,
   /* onPressed: () {Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => MyProducts()),
    );},*/
    ),


          ]),

    ]
    ));
  }
}
