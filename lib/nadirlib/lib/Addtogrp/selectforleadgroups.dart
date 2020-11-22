import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectleads.dart';
//import '/home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp';
//import 'selectleads.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_group.dart' ;
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_group.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_group.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_group.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';
import 'package:flutter/material.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/order.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/userfrontend/lib/proposal/order.dart';
class Name {
  String leadName;
  //String price;
  bool isSelected = false;

  Name({this.leadName, this.isSelected});
}

var names = <Name>[
  Name(leadName: "Lead1", isSelected: false),
  Name(leadName: "Lead2", isSelected: false),
  Name(leadName: "Lead3", isSelected: false),
  Name(leadName: "Lead4", isSelected: false),
  Name(leadName: "Lead5", isSelected: false),
  Name(leadName: "Lead6", isSelected: false),
  Name(leadName: "Lead7", isSelected: false),
  Name(leadName: "Lead8", isSelected: false),


];

void main() => runApp(MyLeads(),
);

class MyLeads extends StatefulWidget {
  /* static const String _title = ' Add Leads';
  List<Name> name;
  _MyLeadsState({Key key, @required this.name}) : super(key: key);*/
  @override
  _MyLeadsState createState() => _MyLeadsState(name: names,);
}

class _MyLeadsState extends State<MyLeads> {
  /* @override
  Widget build(BuildContext context) {
    return Container();*/
  static const String _title = ' Add Leads';
  List<Name> name;
  _MyLeadsState({Key key, @required this.name}) /*: super(key: key)*/
  ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,

      home: Scaffold(
        appBar: AppBar(title: const Text(_title),
        actions:<Widget> [
          new IconButton(icon: Icon( Icons.arrow_right),color: Colors.white, onPressed: () {}),

        ],),
        body:
        ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final item = name[index];

            return LabeledCheckbox(label: item.leadName,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: item.isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  item.isSelected = newValue;
                });
              },

            );
          },
          //child: MyStatefulWidget(),
        ),


      ),
    );
  }

}



/// This Widget is the main application widget.
/*class MyLeads extends StatelessWidget {
  static const String _title = ' Add Leads';
  List<Name> name;
  _MyLeadsState({Key key, @required this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final item = name[index];

            return LabeledCheckbox(label: item.leadName,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: item.isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  item.isSelected = newValue;
                });
              },

            );
          },
          //child: MyStatefulWidget(),
        ),
      ),
    );
  }
}*/

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*void main(){
  runApp( new MaterialApp(home: GroupLeads(),
    debugShowCheckedModeBanner: false,
  ));
}
class GroupLeads extends StatefulWidget {
  @override
  _GroupLeadsState createState() => _GroupLeadsState();}

class _GroupLeadsState extends State<GroupLeads> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
          title: Text("Select Leads"),
          centerTitle: true,
          actions:  <Widget>[
            new IconButton(
                icon:Icon(Icons.search) ,
                onPressed: () {}
            ),

          ]
      ),




      body: new ListView(
          children: <Widget>[

            Container(

              width: 100.0,
              alignment: Alignment.center,
              child: Container(child: Text("Filters"),padding:EdgeInsets.all(8.0) ,),  ),
            FilterGroup(),
            const Divider(
              color: Colors.blue,
              height: 10,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),
            Padding(padding: EdgeInsets.all(8),),
            SelectList(),
          ]

      ),
      /*floatingActionButton: FloatingActionButton(tooltip: " add new group",onPressed: (){},
        child: Icon(Icons.add),
        //color: Colors.blue,
        backgroundColor: Colors.blue,)    ,*/
    );
  }
}*/


