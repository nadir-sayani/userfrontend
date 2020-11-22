import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
/*class Name {
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


];*/
class LeadList extends StatelessWidget {
  static const String _title = ' Add Groups';
//  List<Name> name;
  List name;

  LeadList({Key key, @required this.name}) /*: super(key: key)*/
  ;

  @override
  Widget build(BuildContext context) {
     return ListView.builder(shrinkWrap: true,
        itemCount: name.length,
        itemBuilder: (context, index) {
      final item = name[index];

      return Lead(lead_name: item.leadName,
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

class Lead extends StatelessWidget {
  final String lead_name;

  // final String image_cap;

  Lead({this.lead_name});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: const EdgeInsets.all(2.0),
      /*child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => Bill()),
          );
        },*/

        child: Column(
            children:<Widget>[ Container(
                height: 80.0,
                width: 500,
                color: Colors.white,

                child:
                Padding(padding: EdgeInsets.all(10),
                  child: Align(alignment: Alignment.centerLeft,
                    child: Text(
                      lead_name, style: TextStyle(color: Colors.black,fontSize:20),textAlign: TextAlign.left,),
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

      );
    //);


  }
}

