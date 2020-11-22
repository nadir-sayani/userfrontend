import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
/*import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/HorizontalList/leadhorizontallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/HorizontalList/producthorizontallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/leadverticallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/productverticallist.dart';*/
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/HorizontalList/producthorizontallist.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/productverticallist.dart';
//import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/productverticallist.dart';
import 'package:leadmanagement/nadirlib/lib/VerticalList/productverticallist.dart';

import '../create_product_group.dart';
class Name {
  String groupName;
  //String price;
  bool isSelected = false;

  Name({this.groupName, this.isSelected});
}

var names = <Name>[
  Name(groupName: "Group1", isSelected: false),
  Name(groupName: "Group2", isSelected: false),
  Name(groupName: "Group3", isSelected: false),
  Name(groupName: "Group4", isSelected: false),
  Name(groupName: "Group5", isSelected: false),
  Name(groupName: "Group6", isSelected: false),
  Name(groupName: "Group7", isSelected: false),
  Name(groupName: "Group8", isSelected: false),


];

void main(){
  runApp( new MaterialApp(home: ProdGroup(),
    debugShowCheckedModeBanner: false,
  ));
}
class ProdGroup extends StatefulWidget {
  @override
  _ProdGroupState createState() => _ProdGroupState();}

class _ProdGroupState extends State<ProdGroup> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
          title: Text("Prod Groups"),
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
            ProductHorizontalList(),
            const Divider(
              color: Colors.blue,
              height: 10,
              thickness: 5,
              indent: 0,
              endIndent: 0,
            ),
            Padding(padding: EdgeInsets.all(8),),
            Expanded(child: ProdVerticalList(name:names,))
          ]

      ),
      floatingActionButton: FloatingActionButton(tooltip: " add new group",onPressed: ()=> Navigator.of(context).push(new MaterialPageRoute(
          builder: (context)=>new New_Product_Group())),
        child: Icon(Icons.add),
        //color: Colors.blue,
        backgroundColor: Colors.blue,)    ,
    );
  }
}
























