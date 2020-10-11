import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/Products/addproducts.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/bill.dart';

void main(){
  runApp( new MaterialApp(home: Order(),
    debugShowCheckedModeBanner: false,
  ));
}


class Order extends StatefulWidget {
  @override
  _OrderState createState() => _OrderState();
}

class _OrderState extends State<Order> {
  int count=1;
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
    return Scaffold( appBar: new AppBar( elevation: 0.1,
        title: Text(" Order"),
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
      name.qty++;
    count=name.qty;


    });
    },

    ),
    Padding(padding:EdgeInsets.all(1),child: Text("$count"),),

    IconButton(icon:Icon(Icons.minimize),
    iconSize: 15,
    onPressed: () { setState(() {
      name.qty--;
      count=name.qty;


    }); },

    )] ,),
    )
    ),]
    ),
    )
        .toList()),
            ),
          ),



          ButtonBar(//alignment: MainAxisAlignment.center,
            children: [FlatButton(
              child: Text('Add Products', style: TextStyle(fontSize: 15.0),),
              color: Colors.green,
              splashColor: Colors.teal,
              textColor: Colors.white,
              onPressed: () {Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => MyProducts()),
              );},
            ),

            FlatButton(

              child: Text('Save', style: TextStyle(fontSize: 15.0),),
              color: Colors.green,
              splashColor: Colors.teal,
              textColor: Colors.white,
              onPressed: () {},
            ),
    ]),
          ButtonBar(
            children: [MaterialButton(minWidth: 30,
              child: Text('Clear', style: TextStyle(fontSize: 15.0),),
              color: Colors.redAccent,
              splashColor: Colors.red,
              textColor: Colors.white,
              onPressed: () {},
            )],
          ),
          MaterialButton(minWidth: 70,
            child: Text('Proceed', style: TextStyle(fontSize: 15.0),),
            color: Colors.blue,
            splashColor: Colors.blueGrey,
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => Bill()),
              );
            },
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
  String price;
  int qty;

  ProductName({this.productName, this.price,this.qty});
}

var products = <ProductName>[
  ProductName(productName: "Product1", price: "1000",qty: 1),
  ProductName(productName: "Product2", price: "2000",qty: 1),
  ProductName(productName: "Product3", price: "3000",qty:1),
  ProductName(productName: "Product4", price: "3000",qty:1),

];