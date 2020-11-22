import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/groupmanagement/lib/nadirlib/lib/LeadGroups/group1.dart';
import 'package:file//home/nadir/AndroidStudioProjects/leadmanagement/lib/nadirlib/lib/LeadGroups/group1.dart';


class LeadVerticalList extends StatelessWidget {
  static const String _title = ' Add Groups';
//  List<Name> name;
  List name;

  LeadVerticalList({Key key, @required this.name}) /*: super(key: key)*/
  ;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(shrinkWrap: true,
      itemCount: name.length,
      itemBuilder: (context, index) {
        final item = name[index];

        return Group(group_name: item.groupName,
          /* padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: item.isSelected,*/
          /*onChanged: (bool newValue) {
                setState(() {
                  item.isSelected = newValue;
                });
              },*/

        );
      },);
    //child: MyStat
    /*
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
    );*/

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
            MaterialPageRoute(builder: (context) => LeadGroup1()),
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

    ));
    //);


  }
}



/*class LeadVerticallList extends StatelessWidget {
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

}*/