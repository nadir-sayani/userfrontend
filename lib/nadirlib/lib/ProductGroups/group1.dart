import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
/*import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforleadgroups.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforprodgroups.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/AllLeads/allleads.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/ProductGroups/filter_for_group.dart' ;
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/ProductGroups/list_for_group.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';*/
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforleadgroups.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/AllLeads/allleads.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_group.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_group.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectforprodgroups.dart';
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
  runApp( new MaterialApp(home: ProductGroup1(),
    debugShowCheckedModeBanner: false,
  ));
}
class ProductGroup1 extends StatefulWidget {
  @override
  _ProductGroup1State createState() => _ProductGroup1State();}

class _ProductGroup1State extends State<ProductGroup1> {
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
            LeadList(name: names),
          ]

      ),
      floatingActionButton: FloatingActionButton(tooltip: " add new group", onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
          builder: (context)=>new MyLeads())),
        child: Icon(Icons.add),
        //color: Colors.blue,
        backgroundColor: Colors.blue,)    ,
    );
  }
}

