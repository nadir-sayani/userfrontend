import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/group1.dart';

class LeadVerticallList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
       width:300 ,

          child: Column(


              children: <Widget>[

                Group(
                  group_name: 'Group1',

                ),
                Group(
                  group_name: 'Group2',

                ),
                Group(
                  group_name: 'Group3',

                ),
                Group(
                  group_name: 'Group4',

                ),
               /* Group(
                  group_name: 'group1',

                ),*/


              ]

          ),
        );

  }
}

class Group extends StatelessWidget{
  final String group_name;
 // final String image_cap;

  Group({this.group_name});
  @override
  Widget build(BuildContext context){
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: ()=> Navigator.of(context).push(new MaterialPageRoute(
            builder: (context)=>new LeadGroup1())),

        child: Container(
          height: 80.0,
          color: Colors.blue,

          child:
             Center(
               child: Container(
                 width:500,
                 height: 80,
                 child: Center(child: Text(group_name,style:TextStyle(color: Colors.white),))
                          

           /* subtitle:Container(alignment: Alignment.topCenter,
                  child: Text(image_cap),*/)
          ),
             ),
             ),
    );
      

  }

}