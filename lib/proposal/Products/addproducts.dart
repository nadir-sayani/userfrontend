import 'package:flutter/material.dart';
import 'file:///C:/Users/DARSHAN/AndroidStudioProjects/leadmanagement/lib/proposal/order.dart';
class Name {
  String productName;
  //String price;
  bool isSelected = false;

  Name({this.productName, this.isSelected});
}

var names = <Name>[
  Name(productName: "Product1", isSelected: false),
  Name(productName: "Product2", isSelected: false),
  Name(productName: "Product3", isSelected: false),
  Name(productName: "Product4", isSelected: false),


];

void main() => runApp(MyProducts(),
);

class MyProducts extends StatefulWidget {
 /* static const String _title = ' Add Products';
  List<Name> name;
  _MyProductsState({Key key, @required this.name}) : super(key: key);*/
  @override
  _MyProductsState createState() => _MyProductsState(name: names,);
}

class _MyProductsState extends State<MyProducts> {
 /* @override
  Widget build(BuildContext context) {
    return Container();*/
  static const String _title = ' Add Products';
  List<Name> name;
  _MyProductsState({Key key, @required this.name}) /*: super(key: key)*/
  ;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body:
           ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              final item = name[index];

              return LabeledCheckbox(label: item.productName,
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                value: item.isSelected,
                onChanged: (bool newValue) {
                  setState(() {
                    item.isSelected = newValue;
                  });
                },

              );
            },
            //child: MyStatefulWidget(),
          ),


        ),
      );
  }
 
  }



/// This Widget is the main application widget.
/*class MyProducts extends StatelessWidget {
  static const String _title = ' Add Products';
  List<Name> name;
  _MyProductsState({Key key, @required this.name}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: _title,
      home: Scaffold(
        appBar: AppBar(title: const Text(_title)),
        body: ListView.builder(
          itemCount: name.length,
          itemBuilder: (context, index) {
            final item = name[index];

            return LabeledCheckbox(label: item.productName,
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              value: item.isSelected,
              onChanged: (bool newValue) {
                setState(() {
                  item.isSelected = newValue;
                });
              },

            );
          },
          //child: MyStatefulWidget(),
        ),
      ),
    );
  }
}*/

class LabeledCheckbox extends StatelessWidget {
  const LabeledCheckbox({
    this.label,
    this.padding,
    this.value,
    this.onChanged,
  });

  final String label;
  final EdgeInsets padding;
  final bool value;
  final Function onChanged;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onChanged(!value);
      },
      child: Padding(
        padding: padding,
        child: Row(
          children: <Widget>[
            Expanded(child: Text(label)),
            Checkbox(
              value: value,
              onChanged: (bool newValue) {
                onChanged(newValue);
              },
            ),
          ],
        ),
      ),
    );
  }
}

/*class MyStatefulWidget extends StatefulWidget {
  MyStatefulWidget({Key key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  bool _isSelected = false;

  @override
  Widget build(BuildContext context) {
    return  ListView(
      children: [LabeledCheckbox(
        label: 'This is the label text',
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        value: _isSelected,
        onChanged: (bool newValue) {
          setState(() {
            _isSelected = newValue;
          });
        },
      ),
       /* LabeledCheckbox(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),
        LabeledCheckbox(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),
        LabeledCheckbox(
          label: 'This is the label text',
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          value: _isSelected,
          onChanged: (bool newValue) {
            setState(() {
              _isSelected = newValue;
            });
          },
        ),*/
      ]
    );
  }
}*/

