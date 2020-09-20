import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LeadList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width:300 ,

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
        onTap: () {},

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