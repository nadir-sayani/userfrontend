import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/Products/addproducts.dart';
import 'package:animated_dialog_box/animated_dialog_box.dart';
import 'dart:io';


void main(){
  runApp( new MaterialApp(home: Proposal(),
    debugShowCheckedModeBanner: false,
  ));
}


class Proposal extends StatefulWidget {
  @override
  _ProposalState createState() => _ProposalState();
}

class _ProposalState extends State<Proposal> {
  int count=1;
  int sum=0;
  int tax=18;
  TextEditingController ettax = new TextEditingController(text: "18") ;
  /*Widget bodyData() => DataTable(
      onSelectAll: (b) {},
      sortColumnIndex: 1,
      sortAscending: true,
      columns: <DataColumn>[
        DataColumn(
          label: Text("Product "),
          numeric: false,
          /*onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.productName.compareTo(b.productName));
            });
          },*/


          tooltip: "To display first name of the Name",
        ),
        DataColumn(
          label: Text("Price"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.price.compareTo(b.price));
            });
          },
          tooltip: "To display last name of the Name",
        ),
        DataColumn(
          label: Text("Qty"),
          numeric: false,
          onSort: (i, b) {
            print("$i $b");
            setState(() {
              products.sort((a, b) => a.price.compareTo(b.price));
            });
          },
          tooltip: "To display last name of the Name",
        ),
      ],
      rows: products
          .map(
            (name) => DataRow(
          cells: [

            DataCell(
              /*Text(name.price),
              showEditIcon: false,
              placeholder: false,*/
              Text(name.productName),
              showEditIcon: false,
              placeholder: false,
            ),
            DataCell(Text(name.price),
                showEditIcon: false,
                placeholder: false

            ),
           /*DataCell(Center(
             child: ButtonBar(alignment: MainAxisAlignment.start,
               children: [IconButton(icon:Icon(Icons.add),
                 iconSize: 15,
                 onPressed: () {
                   setState(() {
                     count++;
                   });
                 },

              ),
                Padding(padding:EdgeInsets.all(1),child: Text("$count"),),

                IconButton(icon:Icon(Icons.minimize),
                  iconSize: 15,
                  onPressed: () { setState(() {
                    count--;
                  }); },

                )],),
           )
              /*Text(name.productName),
              showEditIcon: false,
              placeholder: false,*/
            ),*/
           DataCell(Padding(padding: EdgeInsets.all(5),
                            child:ButtonBar(alignment: MainAxisAlignment.start,
                                children: [IconButton(icon:Icon(Icons.add),
                                  iconSize: 15,
                                  onPressed: () {
                                    setState(() {
                                      count++;
                                    });
                                  },

                                ),
                                  Padding(padding:EdgeInsets.all(1),child: Text("$count"),),

                                  IconButton(icon:Icon(Icons.minimize),
                                    iconSize: 15,
                                    onPressed: () { setState(() {
                                      count--;
                                    }); },

                                  )] ,),
                     )
           ),]
        ),
      )
          .toList());*/
  @override
  Widget build(BuildContext context) {
    int total;
    return Scaffold( appBar: new AppBar( elevation: 0.1,
        title: Text(" Proposal"),
        centerTitle: true,
        actions:  <Widget>[
          new IconButton(
              icon:Icon(Icons.search) ,
              onPressed: () {}

          ),

        ]
    ),
        body:/*SingleChildScrollView(scrollDirection: Axis.vertical,
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child:*/
        ListView(
          children: <Widget>[
            Padding(padding: EdgeInsets.all(10),
              child: Container(child: Align(alignment:Alignment.center,child: Text("Customer Name")),),),

            /*Card
            (
               child: bodyData(),
            ),*/
            Container(
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: DataTable(

                    onSelectAll: (b) {},
                    sortColumnIndex: 1,
                    sortAscending: true,
                    columns: <DataColumn>[
                      DataColumn(
                        label: Text("Product "),
                        numeric: false,
                        /*onSort: (i, b) {
                print("$i $b");
                setState(() {
                  products.sort((a, b) => a.productName.compareTo(b.productName));
                });
              },*/


                        tooltip: "To display first name of the Name",
                      ),
                      DataColumn(
                        label: Text("Price"),
                        numeric: true,
                        onSort: (i, b) {
                          print("$i $b");
                          setState(() {
                            products.sort((a, b) => a.price.compareTo(b.price));
                          });
                        },
                        tooltip: "To display last name of the Name",
                      ),

                      DataColumn(
                        label: Text("Qty"),
                        numeric: false,
                        onSort: (i, b) {
                          print("$i $b");
                          setState(() {
                            products.sort((a, b) => a.price.compareTo(b.price));
                          });
                        },
                        tooltip: "To display last name of the Name",
                      ),
                      DataColumn(
                        label: Text("Total"),
                        numeric: false,
                        onSort: (i, b) {
                          print("$i $b");
                          setState(() {
                            products.sort((a, b) => a.price.compareTo(b.price));
                          });
                        },
                        tooltip: "To display last name of the Name",
                      ),
                    ],
                    rows: products
                        .map(
                          (name) => DataRow(
                          cells: [

                            DataCell(
                              /*Text(name.price),
                  showEditIcon: false,
                  placeholder: false,*/
                              Text(name.productName),
                              showEditIcon: false,
                              placeholder: false,
                            ),
                            DataCell(Text("${name.price}"),
                                showEditIcon: false,
                                placeholder: false

                            ),

                            /*DataCell(Center(
                 child: ButtonBar(alignment: MainAxisAlignment.start,
                   children: [IconButton(icon:Icon(Icons.add),
                     iconSize: 15,
                     onPressed: () {
                       setState(() {
                         count++;
                       });
                     },

                  ),
                    Padding(padding:EdgeInsets.all(1),child: Text("$count"),),

                    IconButton(icon:Icon(Icons.minimize),
                      iconSize: 15,
                      onPressed: () { setState(() {
                        count--;
                      }); },

                    )],),
               )
                  /*Text(name.productName),
                  showEditIcon: false,
                  placeholder: false,*/
                ),*/
                            DataCell(Padding(padding: EdgeInsets.all(5),
                              child:ButtonBar(alignment: MainAxisAlignment.start,
                                children: [IconButton(icon:Icon(Icons.add),
                                  iconSize: 15,
                                  onPressed: () {
                                    setState(() {
                                      name.qty++;
                                      count=name.qty;
                                      sum+=name.price;



                                    });
                                  },

                                ),
                                  Padding(padding:EdgeInsets.all(1),child:Text("${name.qty}"),),

                                  IconButton(icon:Icon(Icons.minimize),
                                    iconSize: 15,
                                    onPressed: () { setState(() {
                                      if(name.qty>0) {
                                        name.qty--;
                                        count = name.qty;
                                        sum-=name.price;}


                                    }); },

                                  )] ,),
                            )
                            ),
                            //total=name.qty*name.price;
                            DataCell(Text("${name.price*name.qty}"),
                                showEditIcon: false,
                                placeholder: false

                            ),]
                      ),
                    )
                        .toList()),
              ),
            ),

            Row(//alignment: MainAxisAlignment.center,
                children: [FlatButton(
                  child: Text('TOTAL TAX', style: TextStyle(fontSize: 15.0),),
                  color: Colors.green,
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                  /*onPressed: () {setState(() {
                    sum=
                  });},*/
                ),
                  Padding(padding: EdgeInsets.all(10),),

                  InkWell(child: Container(alignment:Alignment.center,child: Text("$tax",style: TextStyle(),)),onTap : ()async {
                    await animated_dialog_box.showCustomAlertBox(
                        context: context,
                        firstButton: MaterialButton(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(40),
                          ),
                          color: Colors.white,
                          child: Text('Ok'),
                          onPressed: () {


                            /* setState(() {

                              tax=ettax.text as int;

                            });*/
                            Navigator.of(context).pop();

                          },
                        ),
                        yourWidget: Container(
                          child: TextFormField(
                            controller: ettax,
                            decoration: InputDecoration(

                                labelText: 'Enter Total Tax',
                                hintText: "no special characters "
                            ),),
                        ));
                  },),


                ]),



            Row(//alignment: MainAxisAlignment.center,
                children: [FlatButton(
                  child: Text('TOTAL AMOUNT', style: TextStyle(fontSize: 15.0),),
                  color: Colors.green,
                  splashColor: Colors.teal,
                  textColor: Colors.white,
                  /*onPressed: () {setState(() {
                    sum=
                  });},*/
                ),
                  Padding(padding: EdgeInsets.all(10),),

                  /*Container(height: 30,

                    child: Text('$sum', style: TextStyle(fontSize: 15.0),),
                   // color: Colors.green,

                  ),*/
                  Container(height: 30,

                    child: Text('${sum+sum*(tax/100)}', style: TextStyle(fontSize: 15.0),),
                    // color: Colors.green,

                  ),
                ]),
            /*ButtonBar(
              children: [MaterialButton(minWidth: 30,
                child: Text('Clear', style: TextStyle(fontSize: 15.0),),
                color: Colors.redAccent,
                splashColor: Colors.red,
                textColor: Colors.white,
                onPressed: () {},
              )],
            ),*/

            MaterialButton(minWidth: 70,
              child: Text('Proceed', style: TextStyle(fontSize: 15.0),),
              color: Colors.blue,
              splashColor: Colors.blueGrey,
              textColor: Colors.white,
              onPressed: () {},
            )


          ],


        )


    );
    //),
    //);
  }
}
class ProductName {
  String productName;
  int price;
  int qty;

  ProductName({this.productName, this.price,this.qty});
}

var products = <ProductName>[
  ProductName(productName: "Product1", price: 1000,qty: 0),
  ProductName(productName: "Product2", price: 2000,qty: 0),
  ProductName(productName: "Product3", price: 3000,qty:0),
  ProductName(productName: "Product4", price: 3000,qty:0),

];