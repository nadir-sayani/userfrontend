import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/Addtogrp/selectleads.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/filter_for_group.dart' ;
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/list_for_group.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/List_All_Leads/list_all_leads.dart';

void main(){
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
}

