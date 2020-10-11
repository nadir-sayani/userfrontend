//import 'dart:html';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Tasks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tasks',
      theme: ThemeData(
        primaryColor: Colors.blue,
        indicatorColor: Colors.white,
        primaryColorDark: Color(0xFF81D4FA),
        primaryIconTheme: IconThemeData(
          color: Colors.white,
        ),
        textTheme: TextTheme(
          title: TextStyle(color: Colors.white),
        ),
      ),
      home: Home(),
    );

  }
}

class Home extends StatelessWidget {
  final _tabs = <Widget>[
     Tab(text: 'CALLS  (3)',),
    Tab(text: 'MEETINGS  (1)'),
  ];

  static const filterlist = ['today', 'yesterday', 'upcoming', 'history','not interested'];
  var  itemthatisselected = 'today';

  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return DefaultTabController(
        length: 2,
        initialIndex: 1,
        child: Scaffold(
          // top app bar
          appBar: AppBar(
            leading: Icon(Icons.arrow_back),
            title: Text('Tasks'),
            actions: <Widget>[
              IconButton(icon: Icon(Icons.search), onPressed: () {

              }),
              IconButton(icon: Icon(Icons.filter_list), onPressed: () {


              }),
            ],
            bottom: TabBar(tabs: _tabs),
          ),

          // body (tab views)
          body:

          TabBarView(
            children: <Widget>[
              ListView(
                  children: <Widget>[
                    SizedBox(height: 20),
                     Text("you have 3 calls to make today"),

                    SizedBox(height: 30),
                    Container(
                      child: Row(
                    children: <Widget>[
                       Spacer(flex: 1),
                       Text("Customer 1"),
                       Spacer(flex: 1),
                       Icon(Icons.call),
                       Spacer(flex: 1),
                       Icon(Icons.message),
                       Spacer(flex: 1),
                       Icon(Icons.delete),
                        Spacer(flex: 1),
                      ],
                      ),
                  ),
                    Divider(color: Colors.blue,),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Spacer(flex: 1),
                          Text("Customer 2"),
                          Spacer(flex: 1),
                          Icon(Icons.call),
                          Spacer(flex: 1),
                          Icon(Icons.message),
                          Spacer(flex: 1),
                          Icon(Icons.delete),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                    Divider(color: Colors.blue,),
                    Container(
                      child: Row(
                        children: <Widget>[
                          Spacer(flex: 1),
                          Text("Customer 3"),
                          Spacer(flex: 1),
                          Icon(Icons.call),
                          Spacer(flex: 1),
                          Icon(Icons.message),
                          Spacer(flex: 1),
                          Icon(Icons.delete),
                          Spacer(flex: 1),
                        ],
                      ),
                    ),
                  ],
                ),
              ListView(
                children: <Widget>[
                  Card(
                    child: Row(
                      children: <Widget>[
                        Spacer(flex: 1),
                        Text("Customer 3"),
                        Spacer(flex: 1),
                        Icon(Icons.call),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                  Card(
                    child: Row(
                      children: <Widget>[
                        Spacer(flex: 1),
                        Text("Customer 4"),
                        Spacer(flex: 1),
                        Icon(Icons.call),
                        Spacer(flex: 1),
                      ],
                    ),
                  ),
                ],
              ),





            ],
          ),
        )
    );
  }
}