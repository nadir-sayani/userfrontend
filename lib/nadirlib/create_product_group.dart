import 'package:flutter/material.dart';
import 'package:leadmanagement/bill/Products/addproducts.dart';
import 'package:leadmanagement/nadirlib/lib/Addtogrp/selectforleadgroups.dart';
void main(){
  runApp( new MaterialApp(home: New_Product_Group(),
    debugShowCheckedModeBanner: false,
  ));
}
class New_Product_Group extends StatefulWidget {
  @override
  _New_Product_GroupState createState() => _New_Product_GroupState();}

class _New_Product_GroupState extends State<New_Product_Group> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: new AppBar(elevation: 0.1,
            title: Text("New Product Group "),
            centerTitle: true,
            actions: <Widget>[
              new IconButton(
                  icon: Icon(Icons.search),
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
                child: Row(children: <Widget>[Container(child: Align(alignment:Alignment.centerLeft,child: Text("Product Group Name"))),Padding(padding: EdgeInsets.all(5),),Expanded(
                  child: TextField(
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Enter the product group name'
                    ),
                  ),
                ),
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
                  child: Text('Add Leads', style: TextStyle(fontSize: 15.0),),

                  color: Colors.redAccent,
                  splashColor: Colors.red,
                  textColor: Colors.white,
                  onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                      builder: (context)=>new MyLeads())),
                ),
                  MaterialButton(minWidth: 30,
                    child: Text('Add Products', style: TextStyle(fontSize: 15.0),),

                    color: Colors.redAccent,
                    splashColor: Colors.red,
                    textColor: Colors.white,
                    onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context)=>new MyProducts())),
                  ),
                  MaterialButton(minWidth: 30,
                    child: Text('Save', style: TextStyle(fontSize: 15.0),),

                    color: Colors.green,
                    splashColor: Colors.teal,
                    textColor: Colors.white,
                   /* onPressed: () => Navigator.of(context).push(new MaterialPageRoute(
                        builder: (context)=>new MyProducts())),*/
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
            ]
        )
    );
  }
}
