import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'bill.dart';
//import 'package:leadmanagement/proposal/proposal.dart';
//import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/order.dart';
//import 'order.dart';
//import 'proposal.dart';

/*class AllcustomerList extends StatelessWidget {
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
}*/
class Name {
  String customerName;
  //String price;
  bool isSelected = false;

  Name({this.customerName, this.isSelected});
}

var names = <Name>[
  Name(customerName: "Customer1", isSelected: false),
  Name(customerName: "Customer2", isSelected: false),
  Name(customerName: "Customer3", isSelected: false),
  Name(customerName: "Customer4", isSelected: false),
  Name(customerName: "Customer5", isSelected: false),
  Name(customerName: "Customer6", isSelected: false),
  Name(customerName: "Customer7", isSelected: false),
  Name(customerName: "Customer8", isSelected: false),


];

void main() => runApp(MyCustomers(),
);

class MyCustomers extends StatefulWidget {
  /* static const String _title = ' Add Customers';
  List<Name> name;
  _MyCustomersState({Key key, @required this.name}) : super(key: key);*/
  @override
  _MyCustomersState createState() => _MyCustomersState(name: names,);
}

class _MyCustomersState extends State<MyCustomers> {
  /* @override
  Widget build(BuildContext context) {
    return Container();*/
  static const String _title = ' Add Customers';
  List<Name> name;
  _MyCustomersState({Key key, @required this.name}) /*: super(key: key)*/
  ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
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
        body:
        ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final item = name[index];

            return Group(group_name: item.customerName,
              /* padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: item.isSelected,*/
              /*onChanged: (bool newValue) {
                setState(() {
                  item.isSelected = newValue;
                });
              },*/

            );
          },
          //child: MyStatefulWidget(),
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
            MaterialPageRoute(builder: (context) => Bill()),
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

