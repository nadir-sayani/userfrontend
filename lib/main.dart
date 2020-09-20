import 'package:flutter/material.dart';
import 'package:leadmanagement/myprofile.dart';
import 'package:leadmanagement/nadirlib/lib/AllLeads/allleads.dart';
import 'package:leadmanagement/nadirlib/lib/Settings/settingsmain.dart';
import 'package:leadmanagement/nadirlib/lib/leadgroupmain.dart';
import 'package:leadmanagement/nadirlib/lib/productgroupmain.dart';
import 'package:leadmanagement/newlead.dart';


void main() {
  runApp(
    MaterialApp(
        debugShowCheckedModeBanner: false,
        home : HomePage()
    )
  );
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: new AppBar(
        elevation: 0.0,
        backgroundColor: Colors.blue,
        title: Text('Lead Manager',style: TextStyle(color: Colors.white),),
        actions:<Widget> [
          new IconButton(icon: Icon(Icons.search),color: Colors.white, onPressed: () {}),

        ],
      ),
      drawer: new Drawer(
        child: new ListView(
          children:  <Widget>[
            //header
            new UserAccountsDrawerHeader(accountName: Text('Haresh Patel'), accountEmail: Text('xyz@gmail.com'),
              currentAccountPicture: GestureDetector(
                child: new CircleAvatar(
                  backgroundColor: Colors.black,
                  child: Icon(Icons.person,color: Colors.white,),
                ),
              ),
              decoration: new BoxDecoration(
                  color: Colors.blue
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new AllLeads() ));
              },
              child: ListTile(
                title: Text('All Leads'),
                leading: Icon(Icons.format_list_bulleted),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new LeadGroup() ));
              },
              child: ListTile(
                title: Text('Lead Groups'),
                leading: Icon(Icons.group),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new ProductGroup() ));

              },
              child: ListTile(
                title: Text('Product Groups'),
                leading: Icon(Icons.group_work),
              ),
            ),
            InkWell(
              onTap: (){


              },
              child: ListTile(
                title: Text('Tasks'),
                leading: Icon(Icons.alarm),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('bills'),
                leading: Icon(Icons.attach_money),
              ),
            ),
            InkWell(
              onTap: (){},
              child: ListTile(
                title: Text('Proposal'),
                leading: Icon(Icons.mail),
              ),
            ),
            Divider(),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new Settings() ));
              },
              child: ListTile(
                title: Text('Settings'),
                leading: Icon(Icons.settings,color: Colors.blueAccent),
              ),
            ),
            InkWell(
              onTap: (){
                Navigator.of(context).push(new MaterialPageRoute(
                    builder: (context) => new myprofile() ));
              },
              child: ListTile(
                title: Text('My profile'),
                leading: Icon(Icons.person_outline,color: Colors.blueAccent),
              ),
            ),

          ],
        ),
      ),
      body: Center(
        child: Text('Here by default follow ups layout will be displayed,its not construc'),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed:  (){
           Navigator.of(context).push(new MaterialPageRoute(
              builder: (context) => new newlead() ));
        },
      ),
    );
  }
}
