import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';
import 'package:leadmanagement/ContactsPage.dart';
import 'package:leadmanagement/model.dart';
import 'package:leadmanagement/database_helper.dart';
import 'package:intl/intl.dart';
import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:flutter/foundation.dart';
import 'SeeContactsButton.dart';

class LeadDetail extends StatefulWidget {

//  final String appBarTitle;
  final Lead lead;

  LeadDetail(this. lead);

  @override
  State<StatefulWidget> createState() {

    return LeadDetailState(this.lead);
  }
}

class LeadDetailState extends State<LeadDetail> {

  DatabaseHelper helper = DatabaseHelper();

  Lead lead;
  TextEditingController refcontroller = TextEditingController();
  TextEditingController firstnamecontroller = TextEditingController();
  TextEditingController lastnamecontroller = TextEditingController();
  TextEditingController mobile1controller = TextEditingController();
  TextEditingController mobile2controller = TextEditingController();
  TextEditingController email1controller = TextEditingController();
  TextEditingController email2controller = TextEditingController();
  TextEditingController areacontroller = TextEditingController();
  TextEditingController citycontroller = TextEditingController();
  TextEditingController statecontroller = TextEditingController();
  TextEditingController countrycontroller = TextEditingController();
  TextEditingController pincontroller = TextEditingController();
  TextEditingController dobcontroller = TextEditingController();
  TextEditingController companynamecontroller = TextEditingController();
  TextEditingController designationcontroller = TextEditingController();
  TextEditingController workaddcontroller = TextEditingController();
  TextEditingController notescontroller = TextEditingController();

  LeadDetailState(this.lead);




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
  }


  static const leadstagelist = ['open', 'contacted', 'customer', 'interested','not interested'];
  var  currentItemSelected = 'open';
  static const potentiallist = ['hot','warm','cold'];
  var itemselected = 'hot';


  @override
  Widget build(BuildContext context) {
    final halfMediaWidth = MediaQuery.of(context).size.width / 2.0;

    TextStyle textStyle = Theme.of(context).textTheme.title;
    refcontroller.text=lead.ref;
    firstnamecontroller.text = lead.firstname;
    lastnamecontroller.text = lead.lastname;
    mobile1controller.text = lead.mobile1;
    mobile2controller.text = lead.mobile2;
    email1controller.text = lead.email1;
    email2controller.text = lead.email2;
    areacontroller.text = lead.homeaddress;
    citycontroller.text = lead.city;
    statecontroller.text = lead.state;
    countrycontroller.text = lead.country;
    pincontroller.text=lead.pin;
    companynamecontroller.text=lead.companyname;
    designationcontroller.text=lead.designation;
    workaddcontroller.text=lead.workadd;
    notescontroller.text=lead.notes;
    String title;


    return Scaffold(

      //child: Scaffold(
      appBar: AppBar(
        leading: IconButton(icon: Icon(
            Icons.arrow_back),
            onPressed: () {
              // Write some code to control things, when user press back button in AppBar
              moveToLastScreen();
            }
        ),
      ),

      body: Padding(
        padding: EdgeInsets.only(top: 15.0, left: 10.0, right: 10.0),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.all(8.0),
              width: halfMediaWidth,
              child: RaisedButton(
                child: Text("Lead Group"),
                onPressed:  (){
                  _showMultiSelect(context);
                },
              ),
            ),
            Container(
              padding: EdgeInsets.all(6.0),
              alignment: Alignment.topCenter,
              width: halfMediaWidth,
              child: TextField(
                controller: refcontroller,

                style: textStyle,
                onChanged: (value) {
                  updateref();

                },
                decoration: InputDecoration(
                    labelText: 'Referred by ',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),

            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              decoration: myBoxDecoration(),//       <--- BoxDecoration here
              child: Text(
                "Personal Details",
                style: TextStyle(fontSize: 20.0),
              ),
            ),

            SeeContactsButton(),
            SizedBox(height: 18,),

            // Second Element
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child:TextField(
                      controller: firstnamecontroller,
                      style: textStyle,
                      onChanged: (value) {
                        updateFirstname();

                      },
                      decoration: InputDecoration(
                          labelText: 'Firstname',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child: TextField(
                      controller: lastnamecontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatelastname();

                      },
                      decoration: InputDecoration(
                          labelText: 'Lastname',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),

            ),

            // Third Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: mobile1controller,
                style: textStyle,
                onChanged: (value) {
                  updatemobile1();
                },
                decoration: InputDecoration(
                    icon: Icon(Icons.call),
                    labelText: 'Mobile 1',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: mobile2controller,

                style: textStyle,
                onChanged: (value) {
                  updatemobile2();

                },
                decoration: InputDecoration(
                    icon: Icon(Icons.call),
                    labelText: 'Mobile 2',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: email1controller,

                style: textStyle,
                onChanged: (value) {
                  updateemail1();

                },
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email 1',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: email2controller,

                style: textStyle,
                onChanged: (value) {
                  updateemail2();

                },
                decoration: InputDecoration(
                    icon: Icon(Icons.email),
                    labelText: 'Email 2',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              // decoration: myBoxDecoration(),//       <--- BoxDecoration here
              child: Text(
                "Home Address",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child:TextField(
                      controller: areacontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatearea();

                      },
                      decoration: InputDecoration(
                          labelText: 'Area',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child: TextField(
                      controller: citycontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatecity();

                      },
                      decoration: InputDecoration(
                          labelText: 'City',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),

            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child:TextField(
                      controller: statecontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatestate();

                      },
                      decoration: InputDecoration(
                          labelText: 'State',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child: TextField(
                      controller: countrycontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatecountry();

                      },
                      decoration: InputDecoration(
                          labelText: 'Country',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),

            ),
            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child:TextField(
                      controller: pincontroller,

                      style: textStyle,
                      onChanged: (value) {
                        updatepin();

                      },
                      decoration: InputDecoration(
                          labelText: 'Pin code',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                  Container(
                    alignment: Alignment.topCenter,
                    width: 150,
                    height: 80,
                    child: TextField(
                      controller: dobcontroller,

                      style: textStyle,
                      onChanged: (value) {

                      },
                      decoration: InputDecoration(
                          labelText: 'DOB',
                          labelStyle: textStyle,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0)
                          )
                      ),
                    ),
                  ),
                  Spacer(flex: 1,),
                ],
              ),

            ),
            Container(
              decoration: myBoxDecoration(),
              margin: const EdgeInsets.all(20.0),
              padding: const EdgeInsets.all(10.0),
              // decoration: myBoxDecoration(),//       <--- BoxDecoration here
              child: Text(
                "Work Details",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: companynamecontroller,

                style: textStyle,
                onChanged: (value) {
                  updatecompanyname();

                },
                decoration: InputDecoration(
                    labelText: 'Company name',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: designationcontroller,
                style: textStyle,
                onChanged: (value) {
                  updatedesignation();

                },
                decoration: InputDecoration(
                    labelText: 'Designation',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: workaddcontroller,
                style: textStyle,
                onChanged: (value) {
                  updateworkadd();

                },
                decoration: InputDecoration(
                    labelText: 'Work address',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),
            SizedBox(height: 15,),
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
            SizedBox(height: 15,),
            Container(
              padding: EdgeInsets.all(8.0),
              width: halfMediaWidth,
              child: RaisedButton(
                child: Text("Product Group"),
                onPressed:  (){
                  _showMultiSelect(context);
                },
              ),
            ),
            SizedBox(height: 15,),




            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: TextField(
                controller: notescontroller,

                style: textStyle,
                onChanged: (value) {
                  updatenotes();

                },
                decoration: InputDecoration(
                    labelText: 'Notes',
                    labelStyle: textStyle,
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0)
                    )
                ),
              ),
            ),




            // Fourth Element
            Padding(
              padding: EdgeInsets.only(top: 15.0, bottom: 15.0),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Save',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Save button clicked");
                          _save();
                        });
                      },
                    ),
                  ),

                  Container(width: 5.0,),

                  Expanded(
                    child: RaisedButton(
                      color: Theme.of(context).primaryColorDark,
                      textColor: Theme.of(context).primaryColorLight,
                      child: Text(
                        'Delete',
                        textScaleFactor: 1.5,
                      ),
                      onPressed: () {
                        setState(() {
                          debugPrint("Delete button clicked");
                          _delete();
                        });
                      },
                    ),
                  ),

                ],
              ),
            ),

          ],
        ),
      ),

    );
  }

  void moveToLastScreen() {
    Navigator.pop(context, true);
  }





  // Update the title of Lead object
  void updateFirstname(){
    lead.firstname = firstnamecontroller.text;
  }
  void updatelastname(){
    lead.lastname = lastnamecontroller.text;
  }

  // Update the description of Lead object
  void updatemobile1() {
    lead.mobile1 = mobile1controller.text;
  }
  void updatemobile2(){
    lead.mobile2 = mobile2controller.text;
  }
  void updateref(){
    lead.ref = refcontroller.text;
  }
  void updateemail1(){
    lead.email1 = email1controller.text;
  }
  void updateemail2(){
    lead.email2 = email2controller.text;
  }
  void updatearea(){
    lead.homeaddress = areacontroller.text;
  }
  void updatecity(){
    lead.city = citycontroller.text;
  }
  void updatestate(){
    lead.state = statecontroller.text;
  }
  void updatecountry(){
    lead.country = countrycontroller.text;
  }
  void updatepin(){
    lead.pin = pincontroller.text;
  }
  void updatecompanyname(){
    lead.companyname = companynamecontroller.text;
  }
  void updatedesignation(){
    lead.designation = designationcontroller.text;
  }
  void updateworkadd(){
    lead.workadd = workaddcontroller.text;
  }
  void updatenotes(){
    lead.notes = notescontroller.text;
  }


  // Save data to database
  void _save() async {
    moveToLastScreen();


    //lead.date = DateFormat.yMMMd().format(DateTime.now());
    int result;
    if (lead.id != null) {  // Case 1: Update operation
      result = await helper.updateLead(lead);
    } else { // Case 2: Insert Operation
      result = await helper.insertLead(lead);
    }

    if (result != 0) {  // Success
      _showAlertDialog('Status', 'Lead Saved Successfully');
    } else {  // Failure
      _showAlertDialog('Status', 'Problem Saving Lead');
    }

  }

  void _delete() async {

    moveToLastScreen();

    // Case 1: If user is trying to delete the NEW NOTE i.e. he has come to
    // the detail page by pressing the FAB of LeadList page.
    if (lead.id == null) {
      _showAlertDialog('Status', 'No Lead was deleted');
      return;
    }

    // Case 2: User is trying to delete the old lead that already has a valid ID.
    int result = await helper.deleteLead(lead.id);
    if (result != 0) {
      _showAlertDialog('Status', 'Lead Deleted Successfully');
    } else {
      _showAlertDialog('Status', 'Error Occured while Deleting Lead');
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

