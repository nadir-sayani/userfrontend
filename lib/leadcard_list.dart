import 'dart:async';
import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';
import 'package:leadmanagement/newlead.dart';
import 'package:leadmanagement/database_helper.dart';
import 'package:leadmanagement/model.dart';


class LeadList extends StatefulWidget {

  @override
  State<StatefulWidget> createState() {

    return LeadListState();
  }
}

class LeadListState extends State<LeadList> {

  DatabaseHelper databaseHelper = DatabaseHelper();
  List<Lead> leadList;
  int count = 0;

  @override
  Widget build(BuildContext context) {

    if (leadList == null) {
      leadList = List<Lead>();
      updateListView();
    }

    return Scaffold(

      appBar: AppBar(
        title: Text('Leads'),
      ),

      body: getLeadListView(),

    );
  }

  ListView getLeadListView() {

    TextStyle titleStyle = Theme.of(context).textTheme.subhead;

    return ListView.builder(
      itemCount: count,
      itemBuilder: (BuildContext context, int position) {
        return Card(
          color: Colors.white,
          elevation: 2.0,
          child: ListTile(

            title: Text(this.leadList[position].firstname, style: titleStyle,),

            subtitle: Text(this.leadList[position].mobile1),

            trailing: GestureDetector(
              child: Icon(Icons.delete, color: Colors.grey,),
              onTap: () {
                _delete(context, leadList[position]);
              },
            ),


            onTap: () {
              debugPrint("ListTile Tapped");
              navigateToDetail(this.leadList[position]);
            },

          ),
        );
      },
    );
  }


  void _delete(BuildContext context, Lead lead) async {

    int result = await databaseHelper.deleteLead(lead.id);
    if (result != 0) {
      _showSnackBar(context, 'lead Deleted Successfully');
      updateListView();
    }
  }

  void _showSnackBar(BuildContext context, String message) {

    final snackBar = SnackBar(content: Text(message));
    Scaffold.of(context).showSnackBar(snackBar);
  }

  void navigateToDetail(Lead lead) async {
    bool result = await Navigator.push(context, MaterialPageRoute(builder: (context) {
      return leadForm(lead);
    }));

    if (result == true) {
      updateListView();
    }
  }

  void updateListView() {

    final Future<Database> dbFuture = databaseHelper.initializeDatabase();
    dbFuture.then((database) {

      Future<List<Lead>> leadListFuture = databaseHelper.getLeadList();
      leadListFuture.then((leadList) {
        setState(() {
          this.leadList = leadList;
          this.count = leadList.length;
        });
      });
    });
  }
}