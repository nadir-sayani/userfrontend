import 'package:flutter/material.dart';
//import 'package:carousel_pro/carousel_pro.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/HorizontalList/leadhorizontallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/HorizontalList/producthorizontallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/leadverticallist.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/VerticalList/productverticallist.dart';

void main(){
  runApp( new MaterialApp(home: ProductGroup(),
                          debugShowCheckedModeBanner: false,
  ));
}
class ProductGroup extends StatefulWidget {
  @override
   _ProductGroupState createState() => _ProductGroupState();}

class _ProductGroupState extends State<ProductGroup> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: new AppBar( elevation: 0.1,
                        title: Text("Product Groups"),
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
         ProductHorizontalList(),
           const Divider(
             color: Colors.blue,
             height: 10,
             thickness: 5,
             indent: 0,
             endIndent: 0,
           ),
           Padding(padding: EdgeInsets.all(8),),
           ProductVerticallList(),
          ]

    ),
      floatingActionButton: FloatingActionButton(tooltip: " add new group",onPressed: (){},
                                      child: Icon(Icons.add),
                                       //color: Colors.blue,
                                        backgroundColor: Colors.blue,)    ,
    );
  }
}
























