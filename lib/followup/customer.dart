import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
//import 'package:flutter_app_start/LeadGroups/filter_for_group.dart' ;
//import 'package:flutter_app_start/LeadGroups/list_for_group.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/list_all_customers.dart';
import 'list_all_customers.dart';
//import 'package:leadmanagement/Proposal/list_all_customers.dart';


void main(){
  runApp( new MaterialApp(home: CustomerList(),
    debugShowCheckedModeBanner: false,
  ));
}
class CustomerList extends StatefulWidget {
  @override
  _CustomerListState createState() => _CustomerListState();}

class _CustomerListState extends State<CustomerList> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
          title: Text(" Customers"),
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

           /* Container(

              width: 100.0,
              alignment: Alignment.center,
              child: Container(child: Text("Filters"),padding:EdgeInsets.all(8.0) ,),  ),
          // FilterGroup(),
            const Divider(
              color: Colors.blue,
              height: 10,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),*/
            Padding(padding: EdgeInsets.all(8),),
            AllcustomerList(),
          ]

      ),
      /*floatingActionButton: FloatingActionButton(tooltip: " add new group",onPressed: (){},
        child: Icon(Icons.add),
        //color: Colors.blue,
        backgroundColor: Colors.blue,)    ,*/
    );
  }
}

