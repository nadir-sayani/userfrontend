import 'package:flutter/material.dart';
import 'package:validators/validators.dart' as validator;
import 'model.dart';
import 'result.dart';
import 'SeeContactsButton.dart';
import 'package:flutter/cupertino.dart';
import 'package:leadmanagement/SelectDate.dart';
void main() => runApp(newlead());
class newlead extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          title: Text('New Lead',),

          backgroundColor: Colors.blue,
        ),
        body: leadForm(),
      ),
    );
  }
}
class leadForm extends StatefulWidget {

  @override
  _TestFormState createState() => _TestFormState();
}
class _TestFormState extends State<leadForm> {
  final _formKey = GlobalKey<FormState>();
  Model model = Model();
  static const leadstagelist = ['open', 'contacted', 'customer', 'interested','not interested'];
  var  currentItemSelected = 'open';
  static const potentiallist = ['hot','warm','cold'];
  var itemselected = 'hot';
  DateTime selectedDate = DateTime.now();

  _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: selectedDate, // Refer step 1
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
      helpText: 'Select the date', // Can be used as title
      cancelText: 'cancel',
      confirmText: 'Ok',
      errorFormatText: 'Enter valid date',
      fieldHintText: 'Month/Date/Year',
      builder: (context, child) {
        return Theme(
          data: ThemeData.light(), // This will change to light theme.
          child: child,
        );
      },
    );
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }


  @override
  Widget build(BuildContext context) {
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
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'First Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your first name';
                      }
                      return null;
                    },
                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Last Name',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter your last name';
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
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Mobile number 1 ',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter valid mobile number';
                      }
                      return null;
                    },

                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Mobile number 2',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'Enter valid mobile number';
                      }
                      return null;
                    },
                  ),
                )
              ],
            ),

          ),
          MyTextFormField(
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
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Product Group',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'enter the product group';
                      }
                      return null;
                    },

                  ),
                ),
                Container(
                  alignment: Alignment.topCenter,
                  width: halfMediaWidth,
                  child: MyTextFormField(
                    hintText: 'Lead Group',
                    validator: (String value) {
                      if (value.isEmpty) {
                        return 'enter the lead group';
                      }
                      return null;
                    },

                  ),
                )
              ],
            ),

          ),
          SizedBox(   //Use of SizedBox
            height: 20,
          ),

          RaisedButton(
            color: Colors.blueAccent,
            onPressed: () {
            if (_formKey.currentState.validate()) {
                 _formKey.currentState.save();


              AlertDialog(
               title: Text('Saved'),

               );
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
/////////////////////////////////////////////////////////////////////////////////////////////
/*if (_formKey.currentState.validate()) {
_formKey.currentState.save();

Navigator.push(
context,
MaterialPageRoute(
builder: (context) => Result(model: this.model)));
}*/
