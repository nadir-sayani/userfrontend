import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:follow_ups/followupmain.dart';

import 'followupmain.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/order.dart';
/*import 'order.dart';
import 'bill.dart';*/

class AllcustomerList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(


      child: Card(
        child: Column(


            children: <Widget>[

              Group(
                group_name: 'Lead 1',

              ),
              Group(
                group_name: 'Lead 2',

              ),
              Group(
                group_name: 'Lead 3',

              ),
              Group(
                group_name: 'Lead 4',

              ),

              Group(
                group_name: 'Lead 5',

              ),
              Group(
                group_name: 'Lead 6',

              ),
              Group(
                group_name: 'Lead 7',

              ),
              Group(
                group_name: 'Lead 8',

              ),
              /* Group(
                    group_name: 'group1',

                  ),*/


            ]

        ),
      ),
    );

  }
}

class Group extends StatelessWidget {
  final String group_name;

  // final String image_cap;

  Group({this.group_name});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Followup()),
          );
        },

        child: Column(
          children:<Widget>[ Container(
            height: 80.0,
              width: 500,
            color: Colors.white,

            child:
            Padding(padding: EdgeInsets.all(10),
              child: Align(alignment: Alignment.centerLeft,
                child: Text(
                  group_name, style: TextStyle(color: Colors.black,fontSize:20),textAlign: TextAlign.left,),
              ),
            )
            ),
            const Divider(
              color: Colors.black26,
              height: 1,
              thickness: 1,
              indent: 0,
              endIndent: 0,
            ),]
        ),

        ),
    );


  }
}

