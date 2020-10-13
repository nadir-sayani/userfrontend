
import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
//import 'model.dart';
import 'SeeContactsButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:leadmanagement/model.dart';
import 'package:leadmanagement/database_helper.dart';
import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';



  void main(){

    runApp(new MaterialApp(
      home:newlead(),
      ),
    );
  }
   class newlead extends StatelessWidget {
    Lead get lead => lead;
   @override
   Widget build(BuildContext context)
   {
     return Scaffold(
        appBar: AppBar(
        elevation: 0.0,
          title: Text('New Lead',),
          backgroundColor: Colors.blue,
        ),
       body: leadForm(lead),
    );
   }
}
class leadForm extends StatefulWidget {
 // final String appbartitle;
   final Lead lead;
  leadForm(this.lead);

  @override
  State<StatefulWidget> createState()  {
  return leadFormState(this.lead);
}
}
class leadFormState extends State<leadForm> {
  final _formKey = GlobalKey<FormState>();
 // Model model = Model();
  static const leadstagelist = ['open', 'contacted', 'customer', 'interested','not interested'];
  var  currentItemSelected = 'open';
  static const potentiallist = ['hot','warm','cold'];
  var itemselected = 'hot';
  DateTime selectedDate = DateTime.now();

   DatabaseHelper helper = DatabaseHelper();
    Lead lead;

 TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController mobile1controller = TextEditingController();
  leadFormState(this.lead);
  void _showMultiSelect(BuildContext context) async {

    final items = <MultiSelectDialogItem<int>>[
      MultiSelectDialogItem(1, 'P1'),
      MultiSelectDialogItem(2, 'P2'),
      MultiSelectDialogItem(3, 'P3'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,
        );
      },
    );

    print(selectedValues);
    // getvaluefromkey(selectedValues);
  }

  void leadselect(BuildContext context) async {

    final items = <MultiSelectDialogItem<int>>[
      MultiSelectDialogItem(1, 'L1'),
      MultiSelectDialogItem(2, 'L2'),
      MultiSelectDialogItem(3, 'L3'),
    ];

    final selectedValues = await showDialog<Set<int>>(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: items,

        );
      },
    );

    print(selectedValues);
    // getvaluefromkey(selectedValues);
  }







  void moveToLastScreen() {
    Navigator.pop(context, true);
  }

  void updatefirstname(){
    lead.firstname = firstnamecontroller.text;
  }
// Update the description of Note object
  void updatelastname() {
    lead.lastname = lastnamecontroller.text;
  }

  void updatemobile1() {
    lead.mobile1= mobile1controller.text;
  }


// Save data to database
  void _save() async {


    lead.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (lead.id != null) {  // Case 1: Update operation
      result = await helper.updateLead(lead);
    } else { // Case 2: Insert Operation
      result = await helper.insertLead(lead);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Note Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Note');
    }

  }

  void _delete() async {

    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of NoteList page.
    if (lead.id == null) {
      _showAlertDialog('Status', 'No Note was deleted');
      return;
    }

    // Case 2: User is trying to delete the old note that already has a valid ID.
    int result = await helper.deleteLead(lead.id);
    if (result != 0) {
      _showAlertDialog('Status', 'leadDeleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting lead');
    }
  }

  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }




  @override
  Widget build(BuildContext context) {
  //  TextStyle textStyle = Theme.of(context).textTheme.firstname;
    firstnamecontroller.text = lead.firstname;
    lastnamecontroller.text = lead.lastname;
    mobile1controller.text = lead.mobile1;
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;
    return Form(
      key: _formKey,
      child: ListView(
        children: <Widget>[
          SizedBox(   //Use of SizedBox
            height: 20,
          ),
         SeeContactsButton(),
          Container(
            alignment: Alignment.topCenter,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child:TextField(
                    controller: firstnamecontroller,
                    //style: textStyle,
                    onChanged: (value) {
                      updatefirstname();
                    },
                    decoration: InputDecoration(
                        hintText: 'First name',
                        contentPadding: EdgeInsets.all(15.0)
                        //labelStyle: textStyle,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: TextField(
                    controller: lastnamecontroller,
                  //  style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updatelastname();
                    },
                    decoration: InputDecoration(
                        labelText: 'Last name',
                        contentPadding: EdgeInsets.all(15.0)
                       // labelStyle: textStyle,

                    ),
                  ),
                )
              ],
            ),

          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  padding: EdgeInsets.all(8.0),
                  width: halfMediaWidth,
                  child: TextField(
                    controller: mobile1controller,
                    //  style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updatemobile1();
                    },
                   decoration: InputDecoration(
                        labelText: 'mobile number1',
                       contentPadding: EdgeInsets.all(15.0)
                        // labelStyle: textStyle,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8.0),
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: TextField(
                    controller: mobile1controller,
                    //  style: textStyle,
                    onChanged: (value) {
                      debugPrint('Something changed in Title Text Field');
                      updatemobile1();
                    },
                    decoration: InputDecoration(
                        labelText: 'mobile number2',
                        contentPadding: EdgeInsets.all(15.0)
                        // labelStyle: textStyle,

                    ),
                  ),
                )
              ],
            ),

          ),
          /*MyTextFormField(
            hintText: 'Email 1',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          MyTextFormField(
            hintText: 'Email 2',
            isEmail: true,
            validator: (String value) {
              if (!validator.isEmail(value)) {
                return 'Please enter a valid email';
              }
              return null;
            },
          ),
          MyTextFormField(
            hintText: 'Home Address',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter the address';
              }
              return null;
            },
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'City',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter correct city';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'State',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the correct state';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),

          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Country',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'you need to enter country name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'pin',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter the pin';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),

          ),
          Divider(
            thickness: 2,
          ),
          Container(
            margin: const EdgeInsets.all(20.0),
            padding: const EdgeInsets.all(10.0),
            decoration: myBoxDecoration(), //       <--- BoxDecoration here
            child: Text(
              "Work Details",
              style: TextStyle(fontSize: 20.0),
            ),
          ),
          /*Container(
            alignment: Alignment.topCenter,
            // mainAxisSize: MainAxisSize.min,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text(
                  "${selectedDate.toLocal()}".split(' ')[0],
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
                FlatButton(
                  onPressed: () => _selectDate(context), // Refer step 3
                  child: Text(
                    'Select date',
                    style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold,),

                  ),
                  color: Colors.blue,
                ),
              ],
            ),
          ),*/
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Company Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Company Name Required';
                      }
                      return null;
                    },

                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Designation',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Designation';
                      }
                      return null;
                    },

                  ),
                )
              ],
            ),

          ),
          Spacer(flex: 1,),
          MyTextFormField(
            hintText: 'Work Address',
            validator: (String value) {
              if (value.isEmpty) {
                return 'Enter the address';
              }
              return null;
            },
          ),
          SizedBox(   //Use of SizedBox
            height: 20,
          ),

          Container(
            child: Row(
             // crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 60,
              child: InputDecorator(
                 decoration: InputDecoration(
                  labelText: 'Lead Stage',
                 labelStyle: Theme.of(context).primaryTextTheme.caption.copyWith(color: Colors.black),
                 border: const OutlineInputBorder(),
                 ),
                    child: DropdownButtonHideUnderline(
                         child: DropdownButton(
                     isExpanded: true,
                       isDense: true, // Reduces the dropdowns height by +/- 50%
                           icon: Icon(Icons.keyboard_arrow_down),
                           value: currentItemSelected,
                          items: leadstagelist.map((item) {
                            return DropdownMenuItem(
                            value: item,
                       child: Text(item),
                     );
                     }).toList(),
                   onChanged: (selectedItem) => setState(() => currentItemSelected = selectedItem,
                ),
              ),
            ),
               ),
                  ),
            Spacer(flex: 1),
            Container(
              alignment: Alignment.topCenter,
              width: 150,
              height: 60,
                  child: InputDecorator(
                    decoration: InputDecoration(
                      labelText: 'Potential',
                      labelStyle: Theme.of(context).primaryTextTheme.caption.copyWith(color: Colors.black),
                      border: const OutlineInputBorder(),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton(
                        isExpanded: true,
                        isDense: true, // Reduces the dropdowns height by +/- 50%
                        icon: Icon(Icons.keyboard_arrow_down),
                        value: itemselected,
                        items: potentiallist.map((item) {
                          return DropdownMenuItem(
                            value: item,
                            child: Text(item),
                          );
                        }).toList(),
                        onChanged: (selectedItem) => setState(() => itemselected = selectedItem,
                        ),
                      ),
                    ),
                  ),
            ),
                  Spacer(flex: 1),
                ],
          ),
          ),
          SizedBox(   //Use of SizedBox
            height: 40,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: RaisedButton(
                    child: Text("Product Group"),
                    onPressed: (){
                      _showMultiSelect(context);
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: RaisedButton(
                    child: Text("Lead Group"),
                    onPressed:  (){
                      leadselect(context);
                    },
                  ),
                )
              ],
            ),

          ),
          SizedBox(   //Use of SizedBox
            height: 40,
          ),*/

          RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {

              setState(() {
                _save();
              });

            if (_formKey.currentState.validate()) {
                 _formKey.currentState.save();

              }
            },
            child: Text(
              'Save',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(
        width: 3.0
    ),
    borderRadius: BorderRadius.all(
        Radius.circular(10.0) //
    ),
  );
}


class MyTextFormField extends StatelessWidget {
  final String hintText;
  final Function validator;
  final Function onSaved;
  final bool isEmail;

  MyTextFormField({
    this.hintText,
    this.validator,
    this.onSaved,
    this.isEmail = false,

  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: hintText,
          contentPadding: EdgeInsets.all(15.0),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.grey[200],
        ),
        validator: validator,
        onSaved: onSaved,
        keyboardType: isEmail ? TextInputType.emailAddress : TextInputType.text,
      ),
    );
  }
}



class MultiSelectDialogItem<V> {
  const MultiSelectDialogItem(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog<V> extends StatefulWidget {
  MultiSelectDialog({Key key, this.items, this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState<V>();
}

class _MultiSelectDialogState<V> extends State<MultiSelectDialog<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Product'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }




  Widget _buildItem(MultiSelectDialogItem<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}


class MultiSelectDialogItem1<V> {
  const MultiSelectDialogItem1(this.value, this.label);

  final V value;
  final String label;
}

class MultiSelectDialog1<V> extends StatefulWidget {
  MultiSelectDialog1({Key key, this.items, this.initialSelectedValues}) : super(key: key);

  final List<MultiSelectDialogItem1<V>> items;
  final Set<V> initialSelectedValues;

  @override
  State<StatefulWidget> createState() => _MultiSelectDialogState1<V>();
}

class _MultiSelectDialogState1<V> extends State<MultiSelectDialog1<V>> {
  final _selectedValues = Set<V>();

  void initState() {
    super.initState();
    if (widget.initialSelectedValues != null) {
      _selectedValues.addAll(widget.initialSelectedValues);
    }
  }

  void _onItemCheckedChange(V itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedValues.add(itemValue);
      } else {
        _selectedValues.remove(itemValue);
      }
    });
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedValues);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select Lead Group'),
      contentPadding: EdgeInsets.only(top: 12.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }

  Widget _buildItem(MultiSelectDialogItem1<V> item) {
    final checked = _selectedValues.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: (checked) => _onItemCheckedChange(item.value, checked),
    );
  }
}


