import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
/*import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforleadleads.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/AllLeads/allleads.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_lead.dart' ;
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_lead.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';*/
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforleadgroups.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/AllLeads/allleads.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_group.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_group.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';
import 'package:leadmanagement/nadirlib/lib/Addtogrp/selectforleadgroups.dart';

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


void main(){
  runApp( new MaterialApp(home: LeadGroup1(),
    debugShowCheckedModeBanner: false,
  ));
}
class LeadGroup1 extends StatefulWidget {
  @override
  _LeadGroup1State createState() => _LeadGroup1State();}

class _LeadGroup1State extends State<LeadGroup1> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
          title: Text("Group 1"),
          centerTitle: true,
          actions:  <Widget>[
            new IconButton(
                icon:Icon(Icons.search) ,
                onPressed: () {}
            ),

          ]
      ),




      body: new Column(
          children: <Widget>[

            Container(

              width: 100.0,
              alignment: Alignment.center,
              child: Container(child: Text("Filters"),padding:EdgeInsets.all(8.0) ,),  ),
            FilterGroup(),
            const Divider(
              color: Colors.black,
              height: 2,
              thickness: 2,
              indent: 0,
              endIndent: 0,
            ),
            Padding(padding: EdgeInsets.all(8),),
            Expanded(child: LeadList(name: names)),
          ]

      ),
      floatingActionButton: FloatingActionButton(tooltip: " add new lead", onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
          builder: (context)=>new MyLeads())),
        child: Icon(Icons.add),
        //color: Colors.blue,
        backgroundColor: Colors.blue,)    ,
    );
  }
}

